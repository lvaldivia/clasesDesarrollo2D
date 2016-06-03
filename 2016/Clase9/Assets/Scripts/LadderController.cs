using UnityEngine;
using System.Collections;

public class LadderController : MonoBehaviour {

	void OnTriggerEnter2D(Collider2D coll){
		if (coll.gameObject.tag == "player") {
			Hero.instance.onLadder = true;
		}
	}

	void OnTriggerExit2D(Collider2D coll){
		if (coll.gameObject.tag == "player") {
			Hero.instance.onLadder = false;
		}
	}
}
