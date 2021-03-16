using System.Windows;

namespace hand_shaken_webform
{
    public class DialogClass 
    {
        public static void MessageSimple(string message) 
        {
            MessageBox.Show(message, "溫馨提示");
        }

        public static bool MessageChickSimple(string message, MessageBoxButton cancelBtn)
        {

            MessageBoxResult result = MessageBox.Show(message, "溫馨提示", cancelBtn,MessageBoxImage.Question);
            if(result == MessageBoxResult.OK)
            {
                return true;
            }
            else
            {
                return false;
            }
            
        }
    }
}