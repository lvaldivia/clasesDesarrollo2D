using UnityEngine;
using System.Collections;
using UnityEngine.UI;
using UnityEngine.SceneManagement;
using Runner.Utils;

public class StartButton : MonoBehaviour {

	// Use this for initialization
	void Start () {
		GetComponent<Button> ()
			.onClick.AddListener 
				(() => goChooser ());
	}


	void goChooser(){
		SceneManager.
			LoadScene (Global.PLAYER_SELECT);
	}

}
