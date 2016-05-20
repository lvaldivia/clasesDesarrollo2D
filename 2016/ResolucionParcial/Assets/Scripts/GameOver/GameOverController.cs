using UnityEngine;
using System.Collections;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

public class GameOverController : MonoBehaviour {

	// Use this for initialization
	public Button restart;
	public Button back;
	public Text score;
	void Start () {
		restart.onClick.AddListener (() => restartgame ());
		back.onClick.AddListener (() => backMenu ());
		score.text = "Score " + PlayerPrefs.GetInt ("score");
	}

	void restartgame(){
		restart.onClick.RemoveAllListeners ();
		SceneManager.LoadScene ("Game");
	}

	void backMenu(){
		back.onClick.RemoveAllListeners ();
		SceneManager.LoadScene ("Menu");
	}
	

}
