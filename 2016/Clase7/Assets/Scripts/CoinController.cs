using UnityEngine;
using System.Collections;

public class CoinController : MonoBehaviour {

	// Use this for initialization
	AudioSource sound;
	void Start () {
		sound = GetComponent<AudioSource> ();
	}
	
	// Update is called once per frame
	void Update () {
	
	}

	void OnTriggerEnter2D(Collider2D coll){
		if (coll.gameObject.tag == "player") {
			//sound.Play ();
			Invoke ("deactivate", 0.2f);

		}
	}

	void deactivate(){
		gameObject.SetActive (false);
	}
}
