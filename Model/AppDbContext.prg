// AppDbContext.prg
// Created by    : mstas
// Creation Date : 12/31/2024 7:48:52 AM
// Created for   :
// WorkStation   : MSTASAK14


USING System
USING System.Collections.Generic
USING System.Text
USING System.Data.Entity

BEGIN NAMESPACE VSSolutionCatalog.Model

	/// <summary>
    /// The AppDbContext class.
        /// Access using the static singleton Shared
    /// </summary>
	CLASS AppDbContext

	PARTIAL CLASS AppDbContext INHERIT DbContext
        // this manages the connection to the database
        PRIVATE dbProvider AS STRING
        PRIVATE dbDir AS STRING
        //PRIVATE SqlServerConnectString := "Data Source=.;Initial Catalog=ToAll;Integrated Security=true;MultipleActiveResultSets=true;" AS STRING

        CONSTRUCTOR(dbProvider := "POSTGRESQL" AS STRING, dbDir := "F:\\DATA\\" AS STRING)
            SELF.dbProvider := dbProvider
            SELF.dbDir := dbDir
            RETURN
        END CONSTRUCTOR
/* converting from C#...

    PRIVATE STATIC readonly AppDbContext shared = NEW();

    PUBLIC AppDbContext(STRING dbProvider = "SQLite", STRING dbDir = @"F:\Data\") {
        THIS.dbProvider = dbProvider;
        THIS.dbDir = dbDir;
    }

    PUBLIC STATIC AppDbContext Shared => shared;

    PUBLIC DbSet<ToDoItem>? ToDoItems {
        GET; SET;
    }



    PROTECTED OVERRIDE VOID OnConfiguring(DbContextOptionsBuilder optionsBuilder) {
        IF (dbProvider == "SQLite") {
            VAR path = System.IO.Path.Combine(dbDir, "ToDoAll.db");
            optionsBuilder.UseSqlite($"Filename={path}");
        } ELSE { // SQL Server/Express/Desktop
            //optionsBuilder.UseSqlServer(SqlServerConnectString);
            THROW NEW NotImplementedException("This app does not currently support SQL Server.  Try SQLite instead.");
        }
    }

    PUBLIC STRING DbStatus() {
        VAR s = "";
        VAR dbFile = System.IO.Path.Combine(dbDir, "ToDoAll.db");
        s += $"Database filename: {dbFile}";
        VAR fi = NEW FileInfo(dbFile);
        IF (fi.Exists) {
            s += $"\r\n  size: {fi.Length}";
            s += $"\r\n  created: {fi.CreationTime}";
            s += $"\r\n  updated: {fi.LastWriteTime}";
            TRY {
                s += $"\r\n\r\n  Table ToDoItem contains {(ToDoItems?.Count()) ?? 0} rows.";
                FOREACH (VAR row IN ToDoItems!) {
                    s += $"\r\n    {row.Name}";
                }
            } catch {
                s += "\r\n\r\n  Could not access table ToDoItem.";
            }
        } ELSE {
            s += "\r\n  *** file not found ***";
        }
        RETURN s;
    }

    PUBLIC VOID SeedDatabase(bool skipIfRowsPresent = TRUE, bool truncateExistingData = TRUE) {
        IF (ToDoItems == NULL) {
            THROW NEW NullReferenceException("Unexpected null ToDoItems collection");
        }
        VAR hasRows = ToDoItems.Any();
        IF (hasRows) {
            IF (skipIfRowsPresent) {
                RETURN; // unexpected situation
            }
            IF (truncateExistingData) {
                // better approaches exist for large tables:
                //  drop database and recreate
                //  or truncate table tablename
                //  or run raw "delete from tablename" command
                //  (child row deletion first or foreign key disabling may be required!)
                ToDoItems.RemoveRange(ToDoItems);
            } ELSE {
                RETURN; // keep old data and do no populating
            }
        }
        ToDoItems.Add(NEW ToDoItem { Id = ToDoItem.ID_NEW, Name = "Clean Kitchen", Type = ToDoType.ToClean });
        ToDoItems.Add(NEW ToDoItem { Id = ToDoItem.ID_NEW, Name = "Paint House", Type = ToDoType.ToDo });
        ToDoItems.Add(NEW ToDoItem { Id = ToDoItem.ID_NEW, Name = "Upgrade PC C: drive", Type = ToDoType.ToDo });
        ToDoItems.Add(NEW ToDoItem { Id = ToDoItem.ID_NEW, Name = "Install GPUs", Type = ToDoType.ToDo });
        ToDoItems.Add(NEW ToDoItem { Id = ToDoItem.ID_NEW, Name = "Buy Beer", Type = ToDoType.ToBuy });
        ToDoItems.Add(NEW ToDoItem { Id = ToDoItem.ID_NEW, Name = "Learn Kotlin", Type = ToDoType.ToLearn });
        SaveChanges();
    }

                */

//         CONSTRUCTOR()
//             RETURN
//         END CONSTRUCTOR

    END CLASS

END NAMESPACE // VSSolutionCatalog.Model