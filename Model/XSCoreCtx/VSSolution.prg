// VSSolution.prg
// Created by    : mstas
// Creation Date : 12/31/2024 10:37:34 AM
// Created for   :
// WorkStation   : MSTASAK14


USING System
USING System.Collections.Generic
USING System.Text

BEGIN NAMESPACE VSSolutionCatalog.Model

    INTERFACE ITABLEROWMODIFIED
    //    //@[NOTMAPPED];
        PROPERTY OriginalRowValues AS OBJECT[] GET SET
        METHOD IsModified() AS LOGIC
    END INTERFACE



    /// <summary>
    /// The VSSolution class.
    /// </summary>
    CLASS VSSolution IMPLEMENTS ITABLEROWMODIFIED

        /// <summary>
        /// Sentinel value for new row, not added to database yet (-1 will not work here, 0 seems easier than null).
        /// </summary>
        CONST ID_NEW := 0 AS INT
        //PUBLIC STATIC CONST ID_NEW := 0 AS INT <-- A CONST within a CLASS is already STATIC, XS0504
        //PUBLIC STATIC DEFINE ID_NEW := 0 AS INT <-- DEFINE not allowed within CLASS, with or without STATIC modifier, XS9002

        // these properties map to columns in the database
        //[System.ComponentModel.DataAnnotations.Key]
        PROPERTY Id AS INT AUTO GET SET
        PROPERTY Name AS STRING AUTO GET SET
        PROPERTY Path AS STRING AUTO GET SET
        PROPERTY Size AS INT AUTO GET SET
        PROPERTY SlnCreated AS DATETIME AUTO GET SET
        PROPERTY SlnModified AS DATETIME AUTO GET SET
        PROPERTY Description AS STRING AUTO GET SET
        PROPERTY Language AS STRING AUTO GET SET
        PROPERTY Runtime AS STRING AUTO GET SET
        PROPERTY Rating AS INT AUTO GET SET
        PROPERTY RelocateTo AS STRING AUTO GET SET
        PROPERTY Disposition AS STRING AUTO GET SET
        PROPERTY Created AS DATETIME AUTO GET SET
        PROPERTY Updated AS DATETIME AUTO GET SET
        PROPERTY OriginalRowValues AS OBJECT[] AUTO GET SET
        METHOD IsModified() AS LOGIC
            IF OriginalRowValues IS NULL
                THROW System.Exception{"ToDoItem.IsRowModified(): Attempt to compare current row to null OriginalValues row."}
            ENDIF
            RETURN !Compare(OriginalRowValues)
        END METHOD

        METHOD Compare(compareTo AS OBJECT[]) AS LOGIC
            VAR a := SELF
            VAR b := compareTo
            VAR cIx := 1
            IF ISEQUAL(a.Id, b[cIx++]); RETURN FALSE; ENDIF
            IF ISEQUAL(a.Name, b[cIx++]); RETURN FALSE; ENDIF
            IF ISEQUAL(a.Path, b[cIx++]); RETURN FALSE; ENDIF
            IF ISEQUAL(a.Size, b[cIx++]); RETURN FALSE; ENDIF
            IF ISEQUAL(a.SlnCreated, b[cIx++]); RETURN FALSE; ENDIF
            IF ISEQUAL(a.SlnModified, b[cIx++]); RETURN FALSE; ENDIF
            IF ISEQUAL(a.Description, b[cIx++]); RETURN FALSE; ENDIF
            IF ISEQUAL(a.Language, b[cIx++]); RETURN FALSE; ENDIF
            IF ISEQUAL(a.Runtime, b[cIx++]); RETURN FALSE; ENDIF
            IF ISEQUAL(a.Rating, b[cIx++]); RETURN FALSE; ENDIF
            IF ISEQUAL(a.RelocateTo, b[cIx++]); RETURN FALSE; ENDIF
            IF ISEQUAL(a.Disposition, b[cIx++]); RETURN FALSE; ENDIF
            IF ISEQUAL(a.Created, b[cIx++]); RETURN FALSE; ENDIF
            IF ISEQUAL(a.Updated, b[cIx]); RETURN FALSE; ENDIF
            RETURN TRUE
        END METHOD

        STATIC METHOD ISEQUAL(a AS OBJECT, b AS OBJECT) AS LOGIC
            IF (a == NULL) <> (b == NULL); RETURN FALSE; ENDIF
            IF (a == NULL) && (b == NULL); RETURN TRUE; ENDIF
            RETURN a.Equals(b)
            //RETURN TRUE
        END METHOD

        METHOD ToArray() AS OBJECT[]
            RETURN OBJECT[]{14}{Id,Name,Path,Size,SlnCreated,SlnModified, ;
            Description,Language,Runtime,Rating,RelocateTo,Disposition, ;
            Created,Updated}
        END METHOD

        OVERRIDE METHOD ToString() AS STRING
            RETURN Name ?? "no name???";
        END METHOD

        METHOD SaveOriginalRow() AS VOID {
            OriginalValues = Copy(THIS);
        END METHOD

/*
public class ToDoItem {


    //methods


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
        END CONSTRUCTOR
    END CLASS // VSSolution
END NAMESPACE // VSSolutionCatalog.Model