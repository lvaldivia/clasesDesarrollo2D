using UnityEngine;
using System.Collections;

public class Player : MonoBehaviour {

	// Use this for initialization
	HudController hud;
	const string CAMERA = "camera";

	void Start () 
	{
		hud = 
			GameObject.Find (CAMERA).GetComponent<HudController> ();
	}
	
	// Update is called once per frame
	void Update () 
	{
		if (Time.timeScale > 0) {
			Vector3 position = Camera.main.ScreenToWorldPoint 
				(Input.mousePosition);
			transform.position = 
				new Vector3 (transform.position.x, position.y,
					transform.position.z);
		}
	}

	void OnTriggerEnter2D(Collider2D coll){
		coll.gameObject.SetActive (false);
		if (coll.gameObject.tag == "food") {
			hud.updateScore ();
		}else if(coll.gameObject.tag =="enemy"){
			hud.reduceLife();
		}
	}
}
