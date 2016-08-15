package Controladores;

import java.awt.Color;
import java.awt.Graphics2D;
import java.io.FileOutputStream;
import java.rmi.RemoteException;
import java.util.Date;
import java.awt.geom.Rectangle2D;

import org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Combustible;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.DefaultCategoryDataset;
import org.tempuri.IServicioProxy;

import com.itextpdf.awt.DefaultFontMapper;
//import com.itextpdf.awt.geom.Rectangle2D;
import com.itextpdf.awt.geom.Rectangle2D.Double;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfTemplate;
import com.itextpdf.text.pdf.PdfWriter;

public class ControlPDF {
	private static Date FechaInicio;
	private static Date FechaFin;
	private static String EmisionDoc;
	private static String RutaArchivo;

	ControlPDF(Date FechaInicio, Date FechaFin){
		ControlPDF.FechaInicio = FechaInicio;
		ControlPDF.FechaFin = FechaFin;
		ControlPDF.EmisionDoc = Util.formatoStringFecha2(new Date());
		RutaArchivo = "C:/Users/TecnoBencina/Desktop/InfVnt"+EmisionDoc+".pdf";
	}
	
	public static void GenerarPDF()
	{
		try {
			int ancho = 400;
			int largo =600;
			Document pdf = new Document();
			PdfWriter writer = PdfWriter.getInstance(pdf, new FileOutputStream(RutaArchivo));
			pdf.open();
			Creartitulo(pdf);
			InsertarTabla(pdf);
			//GenerarGRafico
			PdfContentByte contentByte = writer.getDirectContent();
			PdfTemplate template = contentByte.createTemplate(largo, ancho);
			@SuppressWarnings("deprecation")
			Graphics2D graphics2d = template.createGraphics(largo, ancho, new DefaultFontMapper());
			java.awt.geom.Rectangle2D rectangle2d = new Rectangle2D.Double(0, 0, largo,ancho);

			GenerarGRafico().draw(graphics2d, rectangle2d);
			
			graphics2d.dispose();
			contentByte.addTemplate(template, 0, 0);
			pdf.close();			
			Util.mensaje("Informe guardado en escritorio" );
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	

	

	private static void Creartitulo(Document pdf)
	{
		try {
			Paragraph linea = new Paragraph();
			linea.add(new Paragraph("Reporte de ventas",FontFactory.getFont("arial",15,Font.NORMAL)));
			linea.setAlignment(Element.ALIGN_MIDDLE);	
			pdf.add(linea);
			pdf.add(new Paragraph("\n"));
			pdf.add(new Paragraph("\n"));
			linea = new Paragraph();
			linea.add(new Paragraph("Emisión Informe: " +EmisionDoc,FontFactory.getFont("arial",15,Font.NORMAL)));
			linea.setAlignment(Element.ALIGN_RIGHT);
			pdf.add(linea);
			linea = new Paragraph();
			linea.add(new Paragraph("Periodo Informe: " + Util.formatoStringFecha(FechaInicio)+" - "+Util.formatoStringFecha(FechaFin),FontFactory.getFont("arial",15,Font.NORMAL)));
			linea.setAlignment(Element.ALIGN_RIGHT);
			pdf.add(linea);
			pdf.add(new Paragraph("\n"));
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	private static void InsertarTabla(Document pdf) {
		try {
			IServicioProxy sv = new IServicioProxy();
			sv.listarVentas();
			int contFilas = 1;
			PdfPTable tabla = new PdfPTable(2);
			PdfPCell celda = new PdfPCell(new Paragraph("Combustible"));
			tabla.addCell(celda);
			celda = new PdfPCell(new Paragraph("Litros"));
			tabla.addCell(celda);
			for (Combustible c : sv.listarCombustibles()) {	
				contFilas++;
				PdfPCell celda1;				
				celda1 = new PdfPCell(new Paragraph(c.getNombre()));
				celda1.setBackgroundColor((contFilas%2==0)?new BaseColor(212,212,212):BaseColor.WHITE);
				tabla.addCell(celda1);
				celda1 = new PdfPCell(new Paragraph(sv.cantLtsVendidosPorComb(c.getId(), Util.DateToCalendar(FechaInicio), Util.DateToCalendar(FechaFin))+"Lts"));
				celda1.setBackgroundColor((contFilas%2==0)?new BaseColor(212,212,212):BaseColor.WHITE);
				tabla.addCell(celda1);				
			}		
			pdf.add(tabla);			
		} catch (Exception e) {
			// TODO: handle exception
		}	
	}
	
	private static JFreeChart GenerarGRafico()
	{
		DefaultCategoryDataset data = new DefaultCategoryDataset();
		JFreeChart Graf = null;
		IServicioProxy sv = new IServicioProxy();
		try {
			for (Combustible c : sv.listarCombustibles()) {
				for (String s : sv.listarIdSurtidoresXCombustible(c.getId())) {					
					String Surtidor = "Surtidor "+ s;
					data.setValue( sv.cantLtsVendidosPorCombuEnSurtidor(c.getId(),Integer.parseInt(s), Util.DateToCalendar(FechaInicio), Util.DateToCalendar(FechaFin)), c.getNombre(),Surtidor);
				}	
			}
			
			Graf = ChartFactory.createBarChart3D("Gràfico Ventas de Combustibles por Surtidor","Surtidor" , "Litros Vendidos", data,PlotOrientation.VERTICAL,true,true,false);
			Graf.setBackgroundPaint(Color.white);
			Graf.getTitle().setPaint(Color.BLACK);
			CategoryPlot p = Graf.getCategoryPlot();
			p.setRangeGridlinePaint(Color.RED);
			
		} catch (RemoteException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return Graf;
	}
	

	
}
