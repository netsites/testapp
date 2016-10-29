package empleados.empleados;
import android.os.AsyncTask;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.TextView;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.List;

/**
 * Created by yoadad on 28/10/2016.
 */


public class EmpleadosTask extends AsyncTask<String,String,String> {

    private TextView textView;
    private ListView listView;
    private ArrayAdapter<String> arrayAdapter;
    public List<Area> Areas;

    public EmpleadosTask(TextView textView){
        this.textView = textView;
        this.textView.setText("Loading...");
    }
    @Override
    protected String doInBackground(String... params) {
        StringBuffer sb = new StringBuffer();
        HttpURLConnection connection = null;
        BufferedReader reader = null;
        String path = params[0];
        try {
            URL url = new URL(path);
            connection = (HttpURLConnection)url.openConnection();
            connection.setRequestMethod("GET");
            connection.setRequestProperty("Content-Type","application/json");
            connection.connect();
            InputStream stream = connection.getInputStream();
            reader = new BufferedReader(new InputStreamReader(stream));
            String line = "";
            while ((line = reader.readLine()) != null){
                sb.append(line);
            }
        }
        catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        finally {
            if (connection != null){
                connection.disconnect();
            }
            try{
                if (reader != null){
                    reader.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return  sb.toString();
    }

    @Override
    protected void onPostExecute(String result)
    {
        Gson gson = new Gson();
        this.Areas = gson.fromJson(result,new TypeToken<List<Area>>(){}.getType());
        super.onPostExecute(result);
        StringBuffer sb = new StringBuffer();
        for (Area area:
             this.Areas) {
            sb.append('\n');
            sb.append("("+area.Id +") "+area.Nombre);
        }
        this.textView.setText(sb.toString());



    }
}


