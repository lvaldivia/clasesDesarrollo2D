using UnityEngine;
using System.Collections;

public class Player : MonoBehaviour {

	// Use this for initialization
	Rigidbody2D body;
	Collider2D coll;
	private bool canJump;
	public LayerMask whatIsGround;
	private float scaleX;
	void Start () {
		scaleX = transform.localScale.x;
		body = GetComponent<Rigidbody2D> ();
		coll = GetComponent<Collider2D> ();
	}
	
	// Update is called once per frame
	void Update () {
		canJump = Physics2D.IsTouchingLayers (coll, whatIsGround);
		if (canJump) {
			if (Input.GetKeyDown (KeyCode.Space)) {
				body.velocity = new Vector2 (body.velocity.x, 5f);
			}	
		}
		if (Input.GetKey (KeyCode.LeftArrow)) {
			transform.localScale = new Vector3 (-scaleX, 
				transform.localScale.y,
				transform.localScale.z);
			body.velocity = new Vector2 (-2f, body.velocity.y);
		}
		if (Input.GetKey (KeyCode.RightArrow)) {
			body.velocity = new Vector2 (2f, body.velocity.y);
			transform.localScale = new Vector3 (scaleX, 
				transform.localScale.y,
				transform.localScale.z);
		}
		if (!Input.anyKey) {
			body.velocity = new Vector2 (0, body.velocity.y);
		}


		//if(Input.getKe)
	}
}
