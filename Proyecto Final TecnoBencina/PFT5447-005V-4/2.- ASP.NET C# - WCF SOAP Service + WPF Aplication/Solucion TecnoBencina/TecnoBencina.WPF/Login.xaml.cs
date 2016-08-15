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
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Text.RegularExpressions;

namespace TecnoBencina.WPF
{
    /// <summary>
    /// Lógica de interacción para MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();

        }

        private void btnSalir_Click(object sender, RoutedEventArgs e)
        {
            Application.Current.Shutdown();
        }

        private void btnAcceder_Click(object sender, RoutedEventArgs e)
        {
            Acceder();
        }

        private void Acceder()
        {
            try
            {
                if (txtPassword.Password.Length > 0 && txtRut.Text.Length > 0)
                {
                    TecnoBencinaSrv.ServicioClient serv = new TecnoBencinaSrv.ServicioClient();
                    if (serv.VerificarUsuario(Int32.Parse(txtRut.Text), txtPassword.Password))
                    {
                        TecnoBencinaSrv.Usuario usr = serv.BuscarUsuario(Int32.Parse(txtRut.Text));
                        if (usr.rol.nombre == "cajero")
                        {
                            Cajero cajero = new Cajero(usr);
                            this.Close();
                            cajero.Show();
                        }
                        else if (usr.rol.nombre == "operador")
                        {
                            Operador operador = new Operador(usr);
                            this.Close();
                            operador.Show();
                        }
                        else
                        {
                            MessageBox.Show("No tienes el rol necesario para utilizar esta aplicacion", "Error");
                        }
                    }
                    else
                    {
                        MessageBox.Show("Credenciales incorrectas", "Error");
                    }

                }
            }
            catch (System.ServiceModel.FaultException)
            {
                MessageBox.Show("Error al establecer coneccion con la base de datos", "Error");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error");
            }
        }
        private void txtRut_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            e.Handled = !IsTextAllowed(e.Text);
        }

        private static bool IsTextAllowed(string text)
        {
            Regex regex = new Regex("[^0-9]+"); //regex that matches disallowed text
            return !regex.IsMatch(text);
        }



        private void txtPassword_KeyUp(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.Enter)
            {
                Acceder();
            }
        }




    }
}
