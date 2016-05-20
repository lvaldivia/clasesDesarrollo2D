using UnityEngine;
using System.Collections;

public class BulletMovement : MonoBehaviour {

	// Use this for initialization
	Rigidbody2D body;
	float speed;
	void Start () {
		body = GetComponent<Rigidbody2D> ();
		Invoke ("kill", 5f);
		speed = 2f * Hero.instance.transform.localScale.x;
	}

	void kill(){
		Destroy (gameObject);
	}

	void Update () {
		body.velocity = new Vector2 (speed, body.velocity.y);
	}
}
