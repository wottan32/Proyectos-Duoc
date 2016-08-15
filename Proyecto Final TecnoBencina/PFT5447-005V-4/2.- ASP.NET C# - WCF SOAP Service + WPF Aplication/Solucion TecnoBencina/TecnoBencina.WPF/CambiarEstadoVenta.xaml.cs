using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace TecnoBencina.WPF
{
    /// <summary>
    /// Lógica de interacción para CambiarEstadoVenta.xaml
    /// </summary>
    public partial class CambiarEstadoVenta : Window
    {
        public TecnoBencinaSrv.Usuario usuario { get; set; }
        TecnoBencinaSrv.ServicioClient serv = new TecnoBencinaSrv.ServicioClient();
       

        public CambiarEstadoVenta(TecnoBencinaSrv.Usuario _usuario)
        {
            InitializeComponent();
            try
            {
                 this.usuario = _usuario;
                 lblNombreUsuario.Content = _usuario.nombres + " " + _usuario.apatrno + " " + _usuario.amaterno;
                 cmbAccion.Items.Add("Seleccione");
                 cmbAccion.Items.Add("Confirmar");
                 cmbAccion.Items.Add("Anular");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error");
            }
        }

        private void btnCambiarEstadoVenta_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                TecnoBencinaSrv.EstadoVenta estadoVenta = new TecnoBencinaSrv.EstadoVenta();
                if (cmbAccion.SelectedIndex == 1)
                {
                    estadoVenta = TecnoBencinaSrv.EstadoVenta.confirmada;
                }
                else if (cmbAccion.SelectedIndex == 2)
                {
                    estadoVenta = TecnoBencinaSrv.EstadoVenta.anulada;
                }
                else
                {
                    throw new ArgumentException("Seleccione una accion");
                }

                serv.SwitchStatusVenta(Int32.Parse(txtIdVenta.Text), estadoVenta, (int)usuario.rut, txtRazon.Text);
                MessageBox.Show("Estado cambiado", "Success");
                LimpiarCambiarEstadoVenta();
            }
            catch (Exception ex)
            {

                MessageBox.Show(ex.Message, "Error");
            }

        }

        private void LimpiarCambiarEstadoVenta()
        {
            cmbAccion.SelectedIndex = 0;
            txtIdVenta.Text = String.Empty;
            txtRazon.Text = String.Empty;
        }
        private void btnSalir_Click(object sender, RoutedEventArgs e)
        {
            Application.Current.Shutdown();
        }

        private void cmbAccion_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (cmbAccion.SelectedIndex == 1)
            {
                lblRazon.Visibility = Visibility.Hidden;
                txtRazon.Visibility = Visibility.Hidden;
            }
            else if (cmbAccion.SelectedIndex == 2)
            {
                lblRazon.Visibility = Visibility.Visible;
                txtRazon.Visibility = Visibility.Visible;

            }
        }

        private void txtIdVenta_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            e.Handled = !Funciones.IsTextAllowed(e.Text);
        }

    }
}
