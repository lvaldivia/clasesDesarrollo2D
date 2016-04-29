using UnityEngine;
using System.Collections;
using UnityEngine.UI;
using UnityEngine.SceneManagement;
using Runner.Utils;

public class PlayerChooser : MonoBehaviour {

	private Button yellow;
	public Button pink,green,blue;
	string player;

	void Start () {
		yellow = 
			GameObject.Find ("yellow").
			GetComponent<Button> ();

		pink.onClick.AddListener (() => choosePink ());
		yellow.onClick.
				AddListener (() => chooseYellow ());
		blue.onClick.
			AddListener (() => chooseBlue ());
		green.onClick.
			AddListener (() => chooseGreen ());
	}

	void choosePink(){
		player = "pink";
		goGame ();
	}

	void chooseYellow(){
		player = "yellow";
		goGame ();
	}

	void chooseBlue(){
		player = "blue";
		goGame ();
	}

	void chooseGreen(){
		player = "green";
		goGame ();
	}

	void goGame(){
		PlayerPrefs.SetString ("color", player);
		SceneManager.LoadScene (Global.GAME);
	}

	

}
