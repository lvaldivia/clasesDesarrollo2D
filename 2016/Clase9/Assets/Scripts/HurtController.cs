using UnityEngine;
using System.Collections;

public class HurtController : MonoBehaviour {

	void OnTriggerEnter2D(Collider2D coll){
		if (coll.gameObject.tag == "player") {
			Hero player = coll.gameObject.GetComponent<Hero> ();
			player.knockBackCount = player.knockBackLenght;
			if (coll.gameObject.transform.position.x < transform.position.x) {
				player.knockbackRight = true;
			} else {
				player.knockbackRight = false;
			}
		}
	}
}
