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
using System.Text.RegularExpressions;

namespace TecnoBencina.WPF
{
    /// <summary>
    /// Lógica de interacción para Cajero.xaml
    /// </summary>
    public partial class Cajero : Window
    {
        TecnoBencinaSrv.ServicioClient serv = new TecnoBencinaSrv.ServicioClient();
        public TecnoBencinaSrv.Usuario usuario { get; set; }
        public List<TecnoBencinaSrv.Surtidor> surtidores { get; set; }
        public List<TecnoBencinaSrv.Combustible> combustiblesPorSurtidor { get; set; }
        public TecnoBencinaSrv.Combustible combustibleSeleccionado { get; set; }
        public Decimal precioPorLitro { get; set; }
        public int cantLitros { get; set; }
        public TecnoBencinaSrv.Vale vale { get; set; }
        public TecnoBencinaSrv.BeneficiarioCredito beneficiario { get; set; }
        public enum mediosDePago { Seleccione, Efectivo, Credito, Vale };


        public Cajero(TecnoBencinaSrv.Usuario _usuario)
        {
            InitializeComponent();
            try
            {
                this.usuario = _usuario;
                this.surtidores = serv.ListarSurtidores().Where(surt => surt.estado).ToList();
                this.cantLitros = 0;

                lblNombreUsuario.Content = _usuario.nombres + " " + _usuario.apatrno + " " + _usuario.amaterno;

                cmbSurtidor.Items.Add("Seleccione");
                cmbSurtidor.SelectedIndex = 0;
                foreach (var srt in surtidores)
                {
                    cmbSurtidor.Items.Add(srt.id);
                }

                cmbCombustibles.Items.Add("Seleccione");
                cmbCombustibles.SelectedIndex = 0;

                cmbMediopago.ItemsSource = Enum.GetValues(typeof(mediosDePago)).Cast<mediosDePago>();
                cmbMediopago.SelectedIndex = 0;
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


        private void cmbSurtidor_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            LimpiarCmbCombustible();
            if (cmbSurtidor.SelectedIndex != 0)
            {

                this.combustiblesPorSurtidor = surtidores.FirstOrDefault(surt => surt.id == cmbSurtidor.SelectedIndex).combustibles.Where(comb => comb.estado).ToList();
                foreach (var srt in combustiblesPorSurtidor.Where(surt => surt.estado))
                {
                    cmbCombustibles.Items.Add(srt.nombre);
                }
            }
        }
        private void cmbCombustibles_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            try
            {

                if (cmbCombustibles.SelectedIndex == 0)
                {
                    txtPrecioLitro.Text = "Seleccione un Combustible";
                    this.combustibleSeleccionado = null;
                    txtDisponibilidad.Text = "Seleccione un Combustible";
                }
                else
                {
                    this.combustibleSeleccionado = combustiblesPorSurtidor.FirstOrDefault(com => com.nombre == cmbCombustibles.SelectedItem);
                    precioPorLitro = serv.BuscarPrecioActualDeCombustible(combustibleSeleccionado.id);

                    txtDisponibilidad.Text = combustibleSeleccionado.cantidadPorSurtidor.ToString();
                    if (precioPorLitro == -1)
                    {
                        txtPrecioLitro.Text = "Sin establecer";
                        txtTotal.Text = String.Empty;
                    }
                    else
                    {
                        txtPrecioLitro.Text = precioPorLitro.ToString();
                        calcularPrecio();
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error");
            }


        }
        private void cmbMediopago_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            txtTotal.Text = string.Empty;
            txtLitros.IsEnabled = true;
            btnVerificar.Visibility = Visibility.Hidden;
            this.vale = null;
            this.beneficiario = null;
            txtMediopago.Text = String.Empty;

            switch ((mediosDePago)cmbMediopago.SelectedIndex)
            {
                case mediosDePago.Seleccione:
                    lblDinamicMedioPago.Visibility = Visibility.Hidden;
                    txtMediopago.Visibility = Visibility.Hidden;
                    break;
                case mediosDePago.Efectivo:
                    lblDinamicMedioPago.Visibility = Visibility.Hidden;
                    txtMediopago.Visibility = Visibility.Hidden;
                    calcularPrecio();
                    break;
                case mediosDePago.Credito:
                    lblDinamicMedioPago.Visibility = Visibility.Visible;
                    txtMediopago.Visibility = Visibility.Visible;
                    lblDinamicMedioPago.Content = "ID Beneficiario";
                    btnVerificar.Visibility = Visibility.Visible;
                    calcularPrecio();
                    break;
                case mediosDePago.Vale:
                    lblDinamicMedioPago.Visibility = Visibility.Visible;
                    txtMediopago.Visibility = Visibility.Visible;
                    txtTotal.Text = "Sin Costo";
                    txtLitros.Text = String.Empty;
                    txtLitros.IsEnabled = false;
                    lblDinamicMedioPago.Content = "Cod. Vale";
                    btnVerificar.Visibility = Visibility.Visible;

                    break;
                default:
                    break;
            }

        }

        /// <summary>
        /// Asegura que txtLitros solo contenga números
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void txtLitros_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            e.Handled = !Funciones.IsTextAllowed(e.Text);
        }

        private void calcularPrecio()
        {
            if (txtLitros.Text.Length > 0)
            {
                if (cmbMediopago.SelectedIndex == 1 || cmbMediopago.SelectedIndex == 2)
                {
                    if (precioPorLitro != -1 && combustibleSeleccionado != null)
                    {
                        if (combustibleSeleccionado.cantidadPorSurtidor > this.cantLitros)
                        {
                            txtTotal.Text = precioPorLitro * this.cantLitros + "";
                        }
                        else
                        {
                            txtTotal.Text = "Cant. lts mayor a disponible";
                            this.cantLitros = 0;
                        }
                    }
                    else
                    {
                        txtTotal.Text = "Precio no establecido";
                        this.cantLitros = 0;
                    }
                }
            }
            else
            {
                txtTotal.Text = "Establezca cant. litros";
            }
        }


        private void txtLitros_KeyUp(object sender, KeyEventArgs e)
        {
            if (this.txtLitros.Text.Length > 0)
            {
                this.cantLitros = Int32.Parse(txtLitros.Text);
            }
            else
            {
                this.cantLitros = 0;
            }

            calcularPrecio();
        }

        private void btnVerificar_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (txtMediopago.Text.Length > 0)
                {
                    if (cmbMediopago.SelectedItem.ToString() == mediosDePago.Credito.ToString())
                    {
                        var bnfciario = serv.BuscarBeneficiario(Int32.Parse(txtMediopago.Text));
                        if (bnfciario.estado && bnfciario.limiteVigencia > DateTime.Now)
                        {
                            this.beneficiario = bnfciario;
                            MessageBox.Show("Beneficiario ingresado correctamente", "Success");
                        }
                        else
                        {
                            MessageBox.Show("El beneficiario ingresado esta deshabilitadoo o ha sobrepasado su limite de vigencia", "Error");
                        }
                    }
                    else if (cmbMediopago.SelectedItem.ToString() == mediosDePago.Vale.ToString())
                    {
                        var vle = serv.BuscarVale(Int32.Parse(txtMediopago.Text));
                        if (vle.estado)
                        {
                            this.vale = vle;
                            txtLitros.Text = ((int)vale.cantidadLitros).ToString();
                            this.cantLitros = (int)vale.cantidadLitros;
                            MessageBox.Show("Vale ingresado correctamente", "Success");
                        }
                        else
                        {
                            MessageBox.Show("El vale ingresado existe, pero esta deshabilitado", "Error");
                        }
                    }
                }

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error");
            }
        }

        private void txtMediopago_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            e.Handled = !Funciones.IsTextAllowed(e.Text);
        }

        private void btnConfirmar_Click(object sender, RoutedEventArgs e)
        {

            try
            {
                if (cmbSurtidor.SelectedIndex == 0)
                {
                    throw new ArgumentException("No ha seleccionado un surtidor");
                }
                else if (combustibleSeleccionado == null)
                {
                    throw new ArgumentException("No ha seleccionado ningun combustible");
                }
                else if (combustibleSeleccionado.precioActual == -1)
                {
                    throw new ArgumentException("El combustible seleccionado no tiene precio establecido");
                }
                else if (this.cantLitros == 0)
                {
                    throw new ArgumentException("No ha establecido una cantidad de litros valida");
                }


                TecnoBencinaSrv.Venta venta = null;

                switch ((mediosDePago)cmbMediopago.SelectedIndex)
                {
                    case mediosDePago.Seleccione:
                        throw new ArgumentException("No ha seleccionado ningun medio de pago");
                    case mediosDePago.Efectivo:
                        venta = serv.CreateVenta(0, cmbSurtidor.SelectedIndex, this.cantLitros, this.combustibleSeleccionado.id, (int)this.usuario.rut, 0, 0);
                        break;
                    case mediosDePago.Credito:
                        if (this.beneficiario != null)
                        {
                            venta = serv.CreateVenta(0, cmbSurtidor.SelectedIndex, this.cantLitros, this.combustibleSeleccionado.id, (int)this.usuario.rut, 0, this.beneficiario.id);
                        }
                        else
                        {
                            throw new ArgumentException("No ha ingresado a ningun beneficiario");
                        }
                        break;
                    case mediosDePago.Vale:
                        if (this.vale != null)
                        {
                            venta = serv.CreateVenta(0, cmbSurtidor.SelectedIndex, this.cantLitros, this.combustibleSeleccionado.id, (int)this.usuario.rut, vale.id, 0);
                        }
                        else
                        {
                            throw new ArgumentException("No ha ingresado ningun vale");
                        }
                        break;
                    default:
                        break;
                }
                //MessageBox.Show("Venta registrada correctamente", "Success");
                if (venta != null)
                {
                    TecnoBencina.WPF.DetalleVenta fromDetalleVenta = new TecnoBencina.WPF.DetalleVenta(venta);
                    fromDetalleVenta.ShowDialog();
                }

                Limpiar();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error");
            }

        }

        private void Limpiar()
        {
            cmbSurtidor.SelectedIndex = 0;
            cmbCombustibles.SelectedIndex = 0;
            txtLitros.Text = string.Empty;
            txtMediopago.Text = string.Empty;
            cmbMediopago.SelectedIndex = 0;
            this.combustibleSeleccionado = null;
            this.cantLitros = 0;
            LimpiarCmbCombustible();
        }
        private void LimpiarCmbCombustible()
        {
            if (cmbCombustibles.Items.Count > 1)
            {
                cmbCombustibles.SelectedIndex = 0;
                for (int i = 1; i <= cmbCombustibles.Items.Count; i++)
                {
                    cmbCombustibles.Items.RemoveAt(1);
                }
            }
        }

        private void MenuItemCambiarEstadoVenta_Click(object sender, RoutedEventArgs e)
        {
            CambiarEstadoVenta formCambEstVent = new CambiarEstadoVenta(this.usuario);
            formCambEstVent.ShowDialog();
        }
    }
}
