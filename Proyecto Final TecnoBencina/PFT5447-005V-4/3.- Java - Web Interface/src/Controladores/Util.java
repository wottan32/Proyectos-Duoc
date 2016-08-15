package Controladores;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;

public class Util {

	static void mensaje(String titulo,String mensaje)
	{
		FacesMessage msg = new FacesMessage(FacesMessage.SEVERITY_INFO,titulo,mensaje );
		FacesContext.getCurrentInstance().addMessage(null, msg);
	}
	
	static void mensaje(String mensaje)
	{
		FacesMessage msg = new FacesMessage(FacesMessage.SEVERITY_INFO,"Información",mensaje );
		FacesContext.getCurrentInstance().addMessage(null, msg);
	}
	
	static String formatoStringFecha(Date date)
	{
		SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
		return format.format(date);	
	}
	
	static String formatoStringFecha2(Date date)
	{
		SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy");
		return format.format(date);	
	}
	
	static Date CalendarToDate(Calendar calendarFormat)
	{
		Calendar c = calendarFormat;
		return c.getTime();
	}
	
	static Calendar DateToCalendar(Date date)
	{
	      Calendar cal = Calendar.getInstance();
		  cal.setTime(date);
		  return cal;
	}
	
	static Calendar StringToCalendar(String fecha)
	{	try {
		SimpleDateFormat formatter = new SimpleDateFormat("dd-MMM-yyyy");		
			return DateToCalendar(formatter.parse(fecha));
		} catch (ParseException e) {
			mensaje("Error", "Formato fecha incorrecto");
			return null;
		}
	}
}
