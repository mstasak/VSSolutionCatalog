// AppDbContext.prg
// Created by    : mstas
// Creation Date : 1/5/2025 11:55:49 AM
// Created for   :
// WorkStation   : MSTASAK14


USING System
USING System.Collections.Generic
USING System.Text

USING System.Data
USING System.Data.Sql
USING System.Data.SqlClient
//USING XSharp.Core
//USING XSharp.RT
//USING XSharp.Data
//USING XSharp.RDD


BEGIN NAMESPACE VSSolutionCatalog.Model

    /* This will be a poor mockup of an EF DBContext subclass, to provide similar entity set access for WPF forms to
    use.  It will not INHERIT FROM DBContext.  It will Access and manipulate data through normal X# data access
    methods??? XSharp.SQLRDD?.
    */

	/// <summary>
    /// The AppDbContext class.
    /// </summary>
	CLASS AppDbContext

    CONSTRUCTOR()
         RETURN

    METHOD GetDataTable( cSelect AS STRING ) AS DataTable
        LOCAL oAdapter AS SqlDataAdapter
        LOCAL oDataSet AS DataSet
        LOCAL oDataTable AS DataTable

        oAdapter := SqlDataAdapter{ cSelect, SELF:Connection }
        oDataSet := DataSet{}
        oAdapter:Fill( oDataSet )
        oDataTable := oDataSet:Tables[0]
        oDataSet := NULL_OBJECT

        RETURN oDataTable

	END CLASS
END NAMESPACE // VSSolutionCatalog.Model.XSCoreCtx