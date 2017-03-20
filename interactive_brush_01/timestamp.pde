import java.text.SimpleDateFormat;
import java.util.Calendar;

String getTimestamp() {
  Calendar now = Calendar.getInstance();
  SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
  return sdf.format(now.getTime());
}