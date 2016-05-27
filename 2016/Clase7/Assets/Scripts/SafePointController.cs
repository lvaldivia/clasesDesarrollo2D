using UnityEngine;
using System.Collections;

public class SafePointController : MonoBehaviour {

	public static SafePointController instance;
	[HideInInspector]
	public Transform position;
	private Transform initial;

	void Awake(){
		instance = this;
	}

	void Start(){
		initial = transform;
	}

	void OnTriggerEnter2D(Collider2D coll){
		if (coll.gameObject.tag == "safePoint") {
			Transform tmp = coll.gameObject.transform; 
			if (position == null) {
				position = tmp;
			} else {
				if (tmp.position.x > position.position.x) {
					position = tmp;
				}
			}
		}
	}

	public void restart(){
		gameObject.SetActive (true);
		if (position != null) {
			transform.position = position.position;
		} else {
			transform.position = initial.position;
		}
		Hero.instance.alive = true;
	}
}
