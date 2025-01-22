// MainViewController.prg
// Created by    : mstas
// Creation Date : 1/10/2025 3:29:13 PM
// Created for   :
// WorkStation   : MSTASAK14


USING System
USING System.Collections.Generic
USING System.Collections.ObjectModel
USING System.ComponentModel
//USING System.Linq
USING System.Runtime.CompilerServices
USING System.Text
USING System.Windows.Input
USING VSSolutionCatalog.Model
USING VSSolutionCatalog.Helper

BEGIN NAMESPACE VSSolutionCatalog

	/// <summary>
    /// The MainViewModel class.
    /// </summary>
	CLASS MainViewModel IMPLEMENTS INotifyPropertyChanged

        /// <summary>
        /// Backing instance variable for StatusText property
        /// </summary>
        PROTECT m_StatusText AS STRING

        /// <summary>
        /// Bindable dependency property for status bar text
        /// </summary>
        /// <value>Current operation or result of user activity</value>
        EXPORT PROPERTY StatusText AS STRING
            GET => m_StatusText
            SET
                m_StatusText := VALUE
                OnPropertyChanged("StatusText")
            END SET
        END PROPERTY

        //PROTECT m_SolutionsList AS ObservableCollection<VSSolution>
        EXPORT PROPERTY SolutionsList AS ObservableCollection<VSSolution> AUTO GET SET
        //    GET => m_StatusText
        //    SET
        //        m_SolutionsList := VALUE
        //        OnPropertyChanged("SolutionsList")
        //    END SET
        //END PROPERTY

        /// <summary>
        /// Bindable data source for solutions list
        /// </summary>
        /// <value>List of solutions to manage</value>
        //EXPORT PROPERTY SolutionsList AS List<STRING> AUTO GET SET

        CONSTRUCTOR()
            StatusText := "(click 'Test' above)"
            SolutionsList := ObservableCollection<VSSolution>{}{ ;
                VSSolution{}{ Id:=1, Name:="VSSolutionCatalog", Path:="F:\\Dev:\\Learn\\XSharp\\VSSolutionCatalog.sln", Description:="Catalog of Visual Studio Projects"}, ;
                VSSolution{}{ Id:=2, Name:="Tic-Tac-Toe", Path:="F:\\Dev:\\Learn\\XSharp\\VSSolutionCatalog.sln", Description:="Catalog of Visual Studio Projects"}, ;
                VSSolution{}{ Id:=3, Name:="Checkers", Path:="F:\\Dev:\\Learn\\XSharp\\VSSolutionCatalog.sln", Description:="Catalog of Visual Studio Projects"}, ;
                VSSolution{}{ Id:=4, Name:="Chess", Path:="F:\\Dev:\\Learn\\XSharp\\VSSolutionCatalog.sln", Description:="Catalog of Visual Studio Projects"}, ;
                VSSolution{}{ Id:=5, Name:="Foundation and Empire", Path:="F:\\Dev:\\Learn\\XSharp\\VSSolutionCatalog.sln", Description:="Catalog of Visual Studio Projects"}, ;
                VSSolution{}{ Id:=6, Name:="Malazans", Path:="F:\\Dev:\\Learn\\XSharp\\VSSolutionCatalog.sln", Description:="Catalog of Visual Studio Projects"} ;
            }
            TestDataLoadCommand := RelayCommand{DELEGATE(o AS OBJECT) { TestDataLoadMethod(o) }, CanAlwaysExecute}
            TestDataAddCommand := RelayCommand{DELEGATE(o AS OBJECT) { TestDataAddMethod(o) }, CanAlwaysExecute}
            TestDataDeleteCommand := RelayCommand{DELEGATE(o AS OBJECT) { TestDataDeleteMethod(o) }, CanAlwaysExecute}
            TestDataSaveCommand := RelayCommand{DELEGATE(o AS OBJECT) { TestDataSaveMethod(o) }, CanAlwaysExecute}
            RETURN
        END CONSTRUCTOR

        STATIC METHOD CanAlwaysExecute(o AS OBJECT) AS LOGIC
            RETURN TRUE
        END METHOD

        #region Implement INotifyPropertyChanged

        PUBLIC EVENT PropertyChanged AS PropertyChangedEventHandler

        PUBLIC VIRTUAL METHOD OnPropertyChanged([CallerMemberName] propertyName := NULL AS STRING) AS VOID
            IF PropertyChanged != NULL
                PropertyChanged(SELF, PropertyChangedEventArgs{propertyName})
            ENDIF
        END METHOD

//      proposed INotifyPropertyChanged methods from Visual Studio (apparently with invalid syntax)
// 	    PUBLIC VIRTUAL METHOD add_PropertyChanged(@@value AS System.ComponentModel.PropertyChangedEventHandler) AS VOID
// 	        THROW NotImplementedException{}
//      END METHOD

// 	    PUBLIC VIRTUAL METHOD remove_PropertyChanged(@@value AS System.ComponentModel.PropertyChangedEventHandler) AS VOID
// 	        THROW NotImplementedException{}
//      END METHOD

        #endregion

        EXPORT PROPERTY TestDataLoadCommand AS ICommand AUTO GET SET
        EXPORT PROPERTY TestDataAddCommand AS ICommand AUTO GET SET
        EXPORT PROPERTY TestDataDeleteCommand AS ICommand AUTO GET SET
        EXPORT PROPERTY TestDataSaveCommand AS ICommand AUTO GET SET

        PROTECTED METHOD TestDataLoadMethod(o AS OBJECT) AS VOID
        END METHOD
        PROTECTED METHOD TestDataAddMethod(o AS OBJECT) AS VOID
        END METHOD
        PROTECTED METHOD TestDataDeleteMethod(o AS OBJECT) AS VOID
            IF SolutionsList.Count > 0
                SolutionsList.RemoveAt(0)
                StatusText := "List item deleted."
            ELSE
                StatusText := "List IS empty."
            END IF
        END METHOD
        PROTECTED METHOD TestDataSaveMethod(o AS OBJECT) AS VOID
        END METHOD

    END CLASS

END NAMESPACE // VSSolutionCatalog