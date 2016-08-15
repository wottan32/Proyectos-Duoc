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
    /// Lógica de interacción para Operador.xaml
    /// </summary>
    public partial class Operador : Window
    {
        TecnoBencinaSrv.ServicioClient serv = new TecnoBencinaSrv.ServicioClient();
        public TecnoBencinaSrv.Usuario usuario { get; set; }
        public List<TecnoBencinaSrv.Surtidor> surtidores { get; set; }
        public List<TecnoBencinaSrv.Combustible> combustibles { get; set; }
        public Operador(TecnoBencinaSrv.Usuario _usuario)
        {
            InitializeComponent();

            try
            {
                this.usuario = _usuario;
                lblNombreUsuario.Content = _usuario.nombres + " " + _usuario.apatrno + " " + _usuario.amaterno;


                cmbSurtidor.Items.Add("Seleccione");
                cmbCombustibles.Items.Add("Seleccione");

                LimpiarCargaCombustible();


                this.surtidores = serv.ListarSurtidores().Where(surt => surt.estado).ToList();
                this.combustibles = serv.ListarCombustibles().Where(comb => comb.estado).ToList();

                foreach (var surt in this.surtidores)
                {
                    cmbSurtidor.Items.Add(surt.id);
                }
                foreach (var comb in this.combustibles)
                {
                    cmbCombustibles.Items.Add(comb.nombre);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error");
            }

        }
        private void btnSalir_Click(object sender, RoutedEventArgs e)
        {
            Application.Current.Shutdown();
        }


        private void btnCargarCombustible_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (cmbCombustibles.SelectedIndex != 0 && cmbSurtidor.SelectedIndex != 0)
                {
                    int idCombustible = combustibles.FirstOrDefault(comb => comb.nombre == cmbCombustibles.SelectedValue.ToString()).id;
                    serv.CargarORemoverCombusible(Int32.Parse(cmbSurtidor.SelectedValue.ToString()), Int32.Parse(txtLitros.Text), idCombustible);
                    MessageBox.Show("Combustible cargado", "Sucess");
                    LimpiarCargaCombustible();
                }
                else
                {
                    MessageBox.Show("Seleccione surtidor y combustible", "Error");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error");
            }

        }

      

        private void LimpiarCargaCombustible()
        {
            cmbCombustibles.SelectedIndex = 0;
            cmbSurtidor.SelectedIndex = 0;
            txtLitros.Text = String.Empty;
        }

        private void MenuItemCambiarEstadoVenta_Click(object sender, RoutedEventArgs e)
        {
            CambiarEstadoVenta formCambEstVent = new CambiarEstadoVenta(this.usuario);
            formCambEstVent.ShowDialog();
        }

        private void txtLitros_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            e.Handled = !Funciones.IsTextAllowed(e.Text);
        }




    }
}
