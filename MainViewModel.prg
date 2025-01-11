// MainViewController.prg
// Created by    : mstas
// Creation Date : 1/10/2025 3:29:13 PM
// Created for   :
// WorkStation   : MSTASAK14


USING System
USING System.Collections.Generic
USING System.Text
USING System.Collections.ObjectModel
USING System.ComponentModel
//USING System.Linq
USING System.Runtime.CompilerServices
    
BEGIN NAMESPACE VSSolutionCatalog

	/// <summary>
    /// The MainViewModel class.
    /// </summary>
	CLASS MainViewModel IMPLEMENTS INotifyPropertyChanged
        PROTECT m_StatusText AS STRING
        EXPORT PROPERTY StatusText AS STRING
            GET => m_StatusText
            SET 
                m_StatusText := VALUE
                OnPropertyChanged("StatusText")
            END SET
        END PROPERTY
        EXPORT PROPERTY SolutionsList AS List<STRING> AUTO GET SET
        
        CONSTRUCTOR()
            StatusText := "Trying hard"
            SolutionsList := List<STRING>{}{"Pomegranates","Cherries","Grapes","Rocks"}
            RETURN
        END CONSTRUCTOR
        


        #region Implement INotifyPropertyChanged
        
        PUBLIC EVENT PropertyChanged AS PropertyChangedEventHandler
        
        //PROTECTED VIRTUAL METHOD OnPropertyChanged([CallerMemberName] propertyName := NULL AS STRING ) AS VOID
        PUBLIC VIRTUAL METHOD OnPropertyChanged([CallerMemberName] propertyName := NULL AS STRING) AS VOID
        
            IF PropertyChanged != NULL 
                PropertyChanged(SELF, PropertyChangedEventArgs{propertyName})
            ENDIF
        END METHOD

// 	    PUBLIC VIRTUAL METHOD add_PropertyChanged(@@value AS System.ComponentModel.PropertyChangedEventHandler) AS VOID
// 	        THROW NotImplementedException{}
//         END METHOD
// 
// 	    PUBLIC VIRTUAL METHOD remove_PropertyChanged(@@value AS System.ComponentModel.PropertyChangedEventHandler) AS VOID
// 	        THROW NotImplementedException{}
//         END METHOD

	    #endregion
	END CLASS
END NAMESPACE // VSSolutionCatalog