USING System
USING System.Collections.Generic
USING System.Linq
USING System.Text
USING System.Threading.Tasks
USING System.Windows
USING System.Windows.Controls
USING System.Windows.Data
USING System.Windows.Documents
USING System.Windows.Input
USING System.Windows.Media
USING System.Windows.Media.Imaging
USING System.Windows.Navigation
USING System.Windows.Shapes

BEGIN NAMESPACE VSSolutionCatalog

    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
PUBLIC PARTIAL CLASS MainWindow INHERIT Window
    
        EXPORT PROPERTY ViewModel AS MainViewModel 
            GET => (MainViewModel)DataContext
        END PROPERTY
        
        METHOD btnTest_Clicked(sender AS OBJECT, e AS RoutedEventArgs) AS VOID
            STATIC rnd := System.Random{} AS System.Random
            VAR strings := STRING[] {3}{"Trying", "Trying harder", "Taking a break"}
            VAR which := (INT)Math.Floor((DECIMAL)rnd.Next()/System.Int32.MaxValue * strings.Count())
            ViewModel.StatusText := strings[which+1]
        END METHOD
        
        PUBLIC CONSTRUCTOR() STRICT
            SELF:InitializeComponent()
            DataContext := MainViewModel{}
            RETURN
        END CONSTRUCTOR

    END CLASS
END NAMESPACE // VSSolutionCatalog
