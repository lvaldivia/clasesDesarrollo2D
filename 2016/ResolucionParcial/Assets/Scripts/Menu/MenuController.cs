using UnityEngine;
using System.Collections;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

public class MenuController : MonoBehaviour {

	public Button startButton;
	void Start () {
		startButton.onClick.AddListener (() => startGame ());
	}
	
	void startGame(){
		startButton.onClick.RemoveAllListeners ();
		SceneManager.LoadScene ("Game");
	}
}
