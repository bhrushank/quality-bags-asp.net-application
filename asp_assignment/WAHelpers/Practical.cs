using System;
using System.Text;
using System.Globalization;
using System.Web;
using System.IO;



namespace WAHelpers
{
    public class Practical
    {
        public static double Sum(double Num1, double Num2)
        {
            double result = Math.Round(Num1) + Math.Round(Num2);
            return result;
        }

        public static double SumAndMult(double Num1, double Num2, double Num3)
        {
            double result = Sum(Num1, Num2) * Num3;
            return result;
        }

        public static string GetCultures()
        {

            StringBuilder sbHTML = new StringBuilder();
            int myInt = 123456;
            CultureInfo[] cultures = CultureInfo.GetCultures(CultureTypes.InstalledWin32Cultures);

            sbHTML.Append("<table id='culture'>");
            sbHTML.Append("<tr>");
            sbHTML.Append("<th>Name</th>");
            sbHTML.Append("<th>Native Name</th>");
            sbHTML.Append("<th>English Name</th>");
            sbHTML.Append("<th>Currency Format</th>");
            sbHTML.Append("</tr>");

            foreach (CultureInfo culture in cultures)
            {
                sbHTML.Append("<tr>");
                sbHTML.Append("<td>" + culture.ToString() + "&nbsp &nbsp &nbsp</td>");
                sbHTML.Append("<td>" + culture.NativeName + "</td>");
                sbHTML.Append("<td>" + culture.EnglishName + "</td>");
                sbHTML.Append("<td align='right'>" + myInt.ToString("C", culture) + "</td>");
                sbHTML.Append("</tr>");
            }

            sbHTML.Append("</table>");

            return sbHTML.ToString();
        }

        public static void GenerateCSVFile()
        {
            //This method generates a CSV file in the folder uploads of your hyperdisc account

            string strCSV = "";
            int myInt = 123456;

            CultureInfo[] cultures = System.Globalization.CultureInfo.GetCultures(CultureTypes.InstalledWin32Cultures);
            StreamWriter swCultures = File.CreateText(HttpContext.Current.Server.MapPath("../uploads/cultures.csv"));

            strCSV += "Name,";
            strCSV += "Native Name,";
            strCSV += "English Name,";
            strCSV += "Currency Format";
            swCultures.WriteLine(strCSV);

            foreach (CultureInfo culture in cultures)
            {
                strCSV = "";
                strCSV += culture.ToString() + ",";
                strCSV += culture.NativeName + ",";
                strCSV += culture.EnglishName + ",";
                strCSV += myInt.ToString("C", culture);
                swCultures.WriteLine(strCSV);
            }
            swCultures.Close();
        }

    }

    public class Utilities
    {
        public static void DisplayString(string input)
        {
            HttpContext.Current.Response.Write("<script language=javascript> alert('" + input + "')</script>");
        }
    }

}
