using ReaderB;
using System;
using System.Text;
using System.Threading;

namespace RFID.CLASE
{
    public class RFID
    {
        private string tag="";
        private string antena;
        // Contiene el identificador unico del tag.
        /// <summary>
        ///     Contiene metodos de get y set, que permite asignar un valor a la etiqueta, como el de obtener una etiqueta leida.
        /// </summary>
        public string Tag
        {
            get
            {
                return this.tag;
            }
            set
            {
                this.tag = value;
            }
        }
        // Guarda el numero de antena por el que ingresa y salen los datos.
        /// <summary>
        ///     Me devuelve el Numero de Antena donde entra y salen los datos.
        /// </summary>
        public string Antena
        {
            get
            {
                return this.antena;
            }
            set
            {
                this.antena = value;
            }
        }


      private byte ipHandle = 255; // Ip del lector en Memoria.
      private int portHandle; // Puerto del lector en Memoria.

      private  string ip = ""; // Ip Logica del lector.
      private  string port = ""; // Puerto Logico del lector.

      private  bool detecion = false;

        public RFID(string ip, string port)
        {
            this.ip = ip;
            this.port = port;
        }

        // Metodo de Conexion al RFID
        /// <summary>
        ///     Conecta el dispositivo RFID
        /// </summary>
        /// <param name="ip">dirección ip del RFID</param>
        /// <param name="puerto">puerto el RFID</param>
        /// <returns>true si conecta el RFID o false si ocurre un error</returns>
        private bool conectarRFID()
        {
            bool result=false;
            int num = 1;    
         num = StaticClassReaderB.OpenNetPort(Convert.ToInt32(this.port), 
           this.ip, ref this.ipHandle, ref this.portHandle);
                  //  StaticClassReaderB .SetBeepNotification(ref this.ipHandle, 0, this.portHandle);

                bool flag = num != 0;


                if (flag)
                {
                    StaticClassReaderB.CloseNetPort(this.portHandle);
                    result = false;
                }
                else
                {
                    result = true;
                }
          
            return result;
        }

        // Metodo de desconexion al RFID
        /// <summary>
        ///     Desconecta el RFID
        /// </summary>
        /// <returns>true si desconecto o false si ocurrio un error.</returns>
        // rfid.io.RFID
        public bool desconectarRFID()
        {
            int num = StaticClassReaderB.CloseNetPort(this.portHandle);
            bool flag = num != 0;
            return !flag;
        }

        // Metodo para iniciar la detección de la etiqueta del vehiculo.
        /// <summary>
        ///     Inicia la detección con el Dispositivo RFID especificado en la estancia del objeto.
        /// </summary>
        /// <returns>YES or err</returns>


        public string iniciarDeteccion()
        {
            bool flag = true;        
            string result;
            detecion = false;
            if (flag)
            {
                try
                {
                   
                       this.detecion = this.detectarEtiqueta();
                        detecion = true;
                        Thread.Sleep(100);
                  
                    result = "YES";
                    return result;
                }
                catch
                {
                    result = "Ha ocurrido errores en la detección de la etiqueta.";
                    return result;
                }
                finally
                {
                    this.desconectarRFID();
                }
            }
            result = "Ha ocurrido un error al conectar con el dispositivo";
            return result;
        }

        

        /// <summary>
        ///     Detiene la deteccion del TAG del dispositivo RFID.
        /// </summary>
        public void detenerDeteccion()
        {
            this.detecion = true;
        }


        /// <summary>
        ///     Metodo para detectar la etiqueta del vehiculo.
        /// </summary>

        private bool detectarEtiqueta()
        {
            byte[] array = new byte[5000];
            byte[] array2 = this.HexStringToByteArray("0000");
            byte b = Convert.ToByte("00");
            byte[] array3 = this.HexStringToByteArray("00");
            byte value = 0;
            int num = 0;
            int num2 = 0;
            int num3 = StaticClassReaderB.Inventory_G2(ref this.ipHandle, 0, array2, b, array3, 0, 0, 0, 0, array, ref value, ref num2, ref num, this.portHandle);
            bool flag = num3 == 1 | num3 == 2 | num3 == 3 | num3 == 4 | num3 == 251;
            bool result;
            if (flag)
            {
                byte[] array4 = new byte[num2];
                Array.Copy(array, array4, num2);
                string text = this.ByteArrayToHexString(array4);
                bool flag2 = num == 0;
                if (flag2)
                {
                    result = false;
                }
                else
                {
                    int num4 = (int)(array4[0] * 2);
                    string text2 = text.Substring(2, num4);
                    bool flag3 = text2.Length == num4 && text2 != "";
                    if (flag3)
                    {
                        this.Tag = text2;
                        this.Antena = Convert.ToString(value, 2);
                        result = true;
                    }
                    else
                    {
                        result = false;
                    }
                }
            }
            else
            {
                result = false;
            }
            return result;
        }



        #region Metodos de Conversion de Bytes
        private byte[] HexStringToByteArray(string s)
        {
            s = s.Replace(" ", "");
            byte[] array = new byte[s.Length / 2];
            for (int i = 0; i < s.Length; i += 2)
            {
                array[i / 2] = Convert.ToByte(s.Substring(i, 2), 16);
            }
            return array;
        }

        private string ByteArrayToHexString(byte[] data)
        {
            StringBuilder stringBuilder = new StringBuilder(data.Length * 3);
            for (int i = 0; i < data.Length; i++)
            {
                byte value = data[i];
                stringBuilder.Append(Convert.ToString(value, 16).PadLeft(2, '0'));
            }
            return stringBuilder.ToString().ToUpper();
        }

        #endregion
    }
}