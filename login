import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;

import DBUtil.DBCon;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.Scene;
import javafx.scene.control.PasswordField;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;
import javafx.scene.layout.AnchorPane;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.Pane;
import javafx.stage.FileChooser;

public class Login extends AnchorPane implements Initializable {
	private MyApp application;

	@FXML
	private Pane LoginFrame;
	@FXML
	private BorderPane layoutPane;
	@FXML
	private TextField username;
	@FXML
	private PasswordField password;

	@FXML
	private void onLoginStaff(ActionEvent event) throws Exception {
		ResultSet rs; 
		DBCon.connect();
		String usernamestr = username.getText();
		String passwdstr = password.getText();
		
		try {
			rs = DBCon.execteQ("select * from staff where username='"+usernamestr+"' and password='"+passwdstr+"'");
			if(rs.next())
			{
				application.stage.hide();
				MainController mainframe = (MainController) Util.replaceSceneContent(application.stage, "MainFrame.fxml");
				mainframe.setApp(application);
							
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	public void setApp(MyApp application) {
		this.application = application;
	}

	@Override
	public void initialize(URL arg0, ResourceBundle arg1) {
		// TODO Auto-generated method stub

	}
}
