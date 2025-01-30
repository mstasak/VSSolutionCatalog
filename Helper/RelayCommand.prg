// RelayCommand.prg
// Created by    : Mark J. Stasak
// Creation Date : 1/12/2025 8:58:51 PM
// Created for   : vssolutioncatalog, an X#, .Net 4.8, MVVM, WPF, PostgreSQL learning project
// WorkStation   : MSTASAK14

// Translated from CSharp from: https://gist.github.com/DevInCube/d7e556c943d72cc4d3a4

USING System
USING System.Collections.Generic
USING System.Text
USING System.Windows.Input

BEGIN NAMESPACE VSSolutionCatalog.Helper

    ///<summary>
    ///    The RelayCommand class.
    ///    A command class derived from ICommnd, which can be used for multiple commands without subclassing.
    ///    Execute() and CanExecute() are provided as anonymous functions/lambdas instead of overriden methods.
    ///</summary>
    PUBLIC CLASS RelayCommand IMPLEMENTS ICommand

        #region Fields

        //PUBLIC PROPERTY execute AS Action<OBJECT> GET _execute SET _execute := VALUE
        PROTECT _execute AS Action<OBJECT>
        PROTECT _canExecute AS Predicate<OBJECT>

        #endregion // Fields

        #region Constructors

        CONSTRUCTOR(pexecute AS Action<OBJECT>)
            SELF(pexecute, NULL)
            RETURN
        END CONSTRUCTOR

        CONSTRUCTOR(pexecute AS Action<OBJECT>, pcanExecute AS Predicate<OBJECT>)
            IF pexecute == NULL
                THROW ArgumentNullException{"execute"}
            ENDIF
            SELF._execute := pexecute
            SELF._canExecute := pcanExecute
            RETURN
        END CONSTRUCTOR

        #endregion // Constructors

        #region ICommand Members

        // [DebuggerStepThrough]
        METHOD ICommand.canExecute(parameter AS OBJECT) AS LOGIC
            RETURN IIF(_canExecute == NULL, TRUE, _canExecute(parameter))
        END METHOD

        EVENT CanExecuteChanged AS EventHandler ;
            ADD CommandManager.RequerySuggested += VALUE ;
            REMOVE CommandManager.RequerySuggested -= VALUE

        METHOD ICommand.execute(param AS OBJECT) AS VOID
            _execute(param)
        END METHOD

        #endregion // ICommand Members

    END CLASS

END NAMESPACE // VSSolutionCatalog.Helper
