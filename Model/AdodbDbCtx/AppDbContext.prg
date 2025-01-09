// AppDbContext.prg
// Created by    : mstas
// Creation Date : 1/5/2025 11:49:17 AM
// Created for   :
// WorkStation   : MSTASAK14


USING System
USING System.Collections.Generic
USING System.Text
USING System.Data
USING System.Data.Common
USING Npgsql
//USING Npgsql.Util


BEGIN NAMESPACE VSSolutionCatalog.Model.AdodbDbCtx

    DEFINE DBCONNECTSTRING := "Host=localhost;Username=VSSolCatUser;Password=password;Database=VSSolCat" AS STRING

    /* This will be a poor mockup of an EF DBContext subclass, to provide similar entity set access for WPF forms to
    use.  It will not inherit from DBContext.  It will access and manipulate data through a normal ADO.NET package.
    I am using Npqsql 5.0.18.
    */

	/// <summary>
    /// The AddDbContext class.
    /// </summary>
	CLASS AppDbContext

        PROTECT dConnection AS NpgsqlConnection
        //PROTECT dAdapter AS DataAdapter
        //PROTECT dSource AS NpgsqlDataSource
        PROTECT dSet AS DataSet
        PROTECT solutionsTable AS DataTable
        PUBLIC PROPERTY Solutions AS DataTable
            GET => solutionsTable
        END PROPERTY

        CONSTRUCTOR()
            //dSource := CreateDataSource()
            dConnection := CreateDbConnection()
            dSet := DataSet{"VSSolCat"} //an arbitrary name, no real significance
            LoadDataset()
            RETURN
        END CONSTRUCTOR

        PROTECTED METHOD CreateDbConnection() AS NpgsqlConnection
            RETURN NpgsqlConnection{DBCONNECTSTRING}
        END METHOD

        //PROTECTED METHOD CreateDataSource() AS System.Data.Common.DbDataSource
        //    // to do: use connect string builder, secure credentials
        //    RETURN NpgsqlDataSource.Create(DBCONNECTSTRING)
        //END METHOD

        METHOD LoadDataset() AS VOID
            dSet.Reset() //remove all tables
            LoadSolutionsTable()
            //load additional tables
        END METHOD

        PROTECTED METHOD LoadSolutionsTable() AS VOID
            VAR query := "SELECT * FROM Solutions"
            VAR SelectCommand := NpgsqlCommand{query, dConnection}
            VAR dAdapter := NpgsqlDataAdapter{SelectCommand}
            dAdapter.Fill(dSet, "Solutions")
            solutionsTable := dSet.Tables["Solutions"]
        END METHOD

        METHOD SaveDataset() AS VOID
            VAR query := "SELECT * FROM Solutions"
            VAR SelectCommand := NpgsqlCommand{query, dConnection}
            // uncertain, will Npgsql fill in the other three commands or must I provide UPD, DEL, INS?
            VAR dAdapter := NpgsqlDataAdapter{SelectCommand}
            dAdapter.Update(dSet)
        END METHOD

    END CLASS

END NAMESPACE // VSSolutionCatalog.Model.AdodbDbCtx