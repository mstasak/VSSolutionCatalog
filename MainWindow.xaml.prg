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

        PUBLIC CONSTRUCTOR() STRICT
            SELF:InitializeComponent()
            RETURN
        END CONSTRUCTOR

    END CLASS
END NAMESPACE // VSSolutionCatalog
