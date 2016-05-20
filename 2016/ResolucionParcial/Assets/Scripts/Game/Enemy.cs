using UnityEngine;
using System.Collections;

public class Enemy : MonoBehaviour {

	Rigidbody2D body;
	void Start () {
		body = GetComponent<Rigidbody2D> ();
	}
	
	// Update is called once per frame
	void Update () {
		body.velocity = new Vector2 (body.velocity.x, -5f);
		if (transform.position.y < -Camera.main.orthographicSize) {
			gameObject.SetActive (false);
		}
	}
}
