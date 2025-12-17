using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices.WindowsRuntime;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;


namespace WindowsFormsApp1
{
    public class DBClass
    {
        string BaglantiAdresi;

        public DBClass() 
        {
            BaglantiAdresi = "Data Source=DESKTOP-SFSL;intial catalog=MyUrun;integrated security= true";
        
        }

        public bool EklemeFonksiyonu(string sorgu)
        {
            SqlConnection baglanti = new SqlConnection(BaglantiAdresi);
            try
            {
                baglanti.Open();
            }
            catch (Exception e)
            {
                return false;
                
            }
            try
            {
                SqlCommand VeriAjani = new SqlCommand(sorgu, baglanti);
                VeriAjani.ExecuteNonQuery();
                baglanti.Close();
                return true;

            }
            catch (Exception f)
            {

               
            }




            return false;
        }

        public bool SilmeFonksiyonu(string sorgu)
        {
            SqlConnection baglanti = new SqlConnection(BaglantiAdresi);
            try
            {
                baglanti.Open();
            }
            catch (Exception e)
            {
                return false;

            }
            try
            {
                SqlCommand VeriAjani = new SqlCommand(sorgu, baglanti);
                VeriAjani.ExecuteNonQuery();
                baglanti.Close();
                return true;

            }
            catch (Exception f)
            {


            }




            return false;
        }

        public DataSet selectFonksiyonu(string sorgu)
        {
            SqlConnection baglanti = new SqlConnection(BaglantiAdresi);
            try
            {
                baglanti.Open();
            }
            catch (Exception e)
            {
                return null;

            }

            try
            {
                SqlDataAdapter veriOperatoru = new SqlDataAdapter(sorgu, baglanti);
                DataSet ds= new DataSet(); 
                veriOperatoru.Fill(ds); 
                return ds;
            }
            catch (Exception f)
            {

                
            }

            return null;
        }

    }
}
