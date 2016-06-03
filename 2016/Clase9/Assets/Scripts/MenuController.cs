using UnityEngine;
using System.Collections;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

public class MenuController : MonoBehaviour {

	public Button button;
	void Start () {
		button.onClick.AddListener (() => startGame ());
	}

	void startGame(){
		button.onClick.RemoveAllListeners ();
		SceneManager.LoadScene ("game");
	}

}
