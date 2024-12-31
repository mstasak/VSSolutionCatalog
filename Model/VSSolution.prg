// VSSolution.prg
// Created by    : mstas
// Creation Date : 12/31/2024 10:37:34 AM
// Created for   :
// WorkStation   : MSTASAK14


USING System
USING System.Collections.Generic
USING System.Text

BEGIN NAMESPACE VSSolutionCatalog.Model

    /// <summary>
    /// The VSSolution class.
    /// </summary>
    CLASS VSSolution

/*
public class ToDoItem {
    /// <summary>
    /// Sentinel value for new row, not added to database yet (-1 will not work here, 0 seems easier than null).
    /// </summary>
    PUBLIC CONST INT ID_NEW = 0;

    // these properties map to columns in the database
    [System.ComponentModel.DataAnnotations.Key]
    PUBLIC INT Id { GET; SET; } = ID_NEW;

    PUBLIC STRING Name { GET; SET; } = "";

    PUBLIC STRING? Body { GET; SET; }

    PUBLIC STRING? Description { GET; SET; }

    PUBLIC ToDoType Type { GET; SET; }

    PUBLIC INT Priority { GET; SET; }

    PUBLIC INT Status { GET; SET; }

    PUBLIC DATETIME? Created { GET; SET; }

    PUBLIC DATETIME? Updated { GET; SET; }

    // not db columns

    [NotMapped]
    PUBLIC ToDoItem? OriginalValues { GET; SET; }

    //methods
    PUBLIC bool IsRowModified() {
        IF (OriginalValues IS NULL) {
            THROW NEW InvalidOperationException("ToDoItem.IsRowModified(): Attempt to compare current row to null OriginalValues row.");
        }
        RETURN !Compare(THIS, OriginalValues);
    }

    PUBLIC OVERRIDE STRING ToString() {
        RETURN Name ?? "no name???";
    }

    PUBLIC ToDoItem() {
        // to enable developers to add products to a Category we must
        // initialize the navigation property to an empty collection
        //Products = new HashSet<Product>();
    }

    PUBLIC VOID SaveOriginalRow() {
        OriginalValues = Copy(THIS);
    }

    /// <summary>
    /// Returns a copy of the ToDoItem "original".
    /// Optionally preserve ToDoId, Created, and Updated
    /// </summary>
    /// <param name="original">The ToDoItem to be copied</param>
    /// <param name="copyId">If true, preserve original.id, else set to TODO_ID_NEW</param>
    /// <param name="copyTimestamps">If true, preserve original.Created and .Updated,
    /// else set to current date and time</param>
    /// <returns>The newly created ToDoItem</returns>
    PUBLIC STATIC ToDoItem Copy(ToDoItem original, bool copyId = TRUE, bool copyTimestamps = TRUE) {
        VAR rslt = NEW ToDoItem();
        VAR now = DateTime.UtcNow;
        rslt.Id = copyId ? original.Id : ID_NEW;
        rslt.Name = original.Name;
        rslt.Body = original.Body;
        rslt.Description = original.Description;
        rslt.Type = original.Type;
        rslt.Priority = original.Priority;
        rslt.Status = original.Status;
        rslt.Created = copyTimestamps ? original.Created : now;
        rslt.Updated = copyTimestamps ? original.Updated : now;
        RETURN rslt;
    }

    PUBLIC STATIC bool Compare(ToDoItem s1, ToDoItem s2, bool emptyStringEqualsNull = TRUE, bool compareId = TRUE, bool compareTimestamps = FALSE) {
        IF (compareId && !DbUtility.ValueEquals(s1.Id, s2.Id)) { RETURN FALSE; }
        IF (!DbUtility.ValueEquals(s1.Name, s2.Name, emptyStringEqualsNull)) { RETURN FALSE; }
        IF (!DbUtility.ValueEquals(s1.Body, s2.Body, emptyStringEqualsNull)) { RETURN FALSE; }
        IF (!DbUtility.ValueEquals(s1.Description, s2.Description, emptyStringEqualsNull)) { RETURN FALSE; }
        IF (!DbUtility.ValueEquals(s1.Type, s2.Type, emptyStringEqualsNull)) { RETURN FALSE; }
        IF (!DbUtility.ValueEquals(s1.Priority, s2.Priority)) { RETURN FALSE; }
        IF (!DbUtility.ValueEquals(s1.Status, s2.Status)) { RETURN FALSE; }
        IF (compareTimestamps && !DbUtility.ValueEquals(s1.Created, s2.Created)) { RETURN FALSE; }
        IF (compareTimestamps && !DbUtility.ValueEquals(s1.Updated, s2.Updated)) { RETURN FALSE; }
        RETURN TRUE;
    }

    PUBLIC VOID CopyFrom(ToDoItem source) {
        Id = source.Id;
        Name = source.Name;
        Body = source.Body;
        Description = source.Description;
        Type = source.Type;
        Priority = source.Priority;
        Status = source.Status;
        Created = source.Created;
        Updated = source.Updated;
    }
            */

        CONSTRUCTOR()
            RETURN
    END CLASS
END NAMESPACE // VSSolutionCatalog.Model