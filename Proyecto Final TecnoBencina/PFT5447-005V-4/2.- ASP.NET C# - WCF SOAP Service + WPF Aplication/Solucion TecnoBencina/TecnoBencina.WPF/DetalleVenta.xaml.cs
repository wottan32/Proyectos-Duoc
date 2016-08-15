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
using ZXing;
using ZXing.QrCode;
using ZXing.Common;
using System.IO;
using ZXing.QrCode.Internal;

using ZXing.Rendering;
using System.Drawing;
using System.Drawing.Imaging;



namespace TecnoBencina.WPF
{
    /// <summary>
    /// Lógica de interacción para DetalleVenta.xaml
    /// </summary>
    public partial class DetalleVenta : Window
    {
        public TecnoBencinaSrv.Venta venta { get; set; }


        public DetalleVenta(TecnoBencinaSrv.Venta _venta)
        {
            InitializeComponent();

            this.venta = _venta;

            qrCode.Source = GenerateQR(100, 100, this.venta.id.ToString());
            lvlContentIdVenta.Content = this.venta.id;
            lvlContentNombreVendedor.Content = this.venta.usuario.nombres + " " + this.venta.usuario.apatrno;
            lvlContentSurtidor.Content = this.venta.surtidor.id;
            lvlContentCombustible.Content = this.venta.combustible.id;
            lvlContentLitros.Content = this.venta.litros;
            lvlContentMonto.Content = this.venta.monto;
            

            if (this.venta.vale!=null)
            {
                lblVale.Visibility = Visibility.Visible;
                lvlContentVale.Visibility = Visibility.Visible;
                lvlContentVale.Content = this.venta.vale.id;

            }
            if (this.venta.beneficiarioCredito!=null)
            {
                lblBeneficiario.Visibility = Visibility.Visible;
                lblContentBeneficiario.Visibility = Visibility.Visible;
                lblContentBeneficiario.Content = this.venta.beneficiarioCredito.id;
            }
        }

        private void btnCerrar_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void btnImprimir_Click(object sender, RoutedEventArgs e)
        {
            MessageBox.Show("Aquí va la logica de impresión", "Error");
        }


        public BitmapSource GenerateQR(int width, int height, string _qrValue)
        {
            var qrcode = new QRCodeWriter();
            var barcodeWriter = new BarcodeWriter
            {
                Format = BarcodeFormat.QR_CODE,
                Options = new EncodingOptions
                {
                    Height = height,
                    Width = width,
                    Margin = 1
                }
            };

            using (Bitmap bitmap = barcodeWriter.Write(_qrValue))
            using (var stream = new MemoryStream())
            {
                bitmap.Save(stream, ImageFormat.Png);

                BitmapImage bi = new BitmapImage();
                bi.BeginInit();
                stream.Seek(0, SeekOrigin.Begin);
                bi.StreamSource = stream;
                bi.CacheOption = BitmapCacheOption.OnLoad;
                bi.EndInit();
                return bi;
            }
        }
    }
}
