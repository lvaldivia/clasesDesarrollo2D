using UnityEngine;
using System.Collections;

public class EnemyMovement : MonoBehaviour {

	public LayerMask whatIsGround;
	public float radius;
	bool isInGround;
	bool hitWall;
	Transform groundPos;
	Transform wallPos;
	public bool movingLeft;
	float speed=4f;
	Rigidbody2D body;

	void Start () {
		groundPos = transform.GetChild (0).transform;	
		wallPos = transform.GetChild (1).transform;	
		if (movingLeft) {
			transform.localScale = new Vector3 (1f, 1f);
		} else {
			transform.localScale = new Vector3 (-1f, 1f);
		}
		body = GetComponent<Rigidbody2D> ();
	}

	void Update () {
		isInGround = Physics2D.OverlapCircle (groundPos.position, radius, whatIsGround);
		hitWall = Physics2D.OverlapCircle (wallPos.position, radius, whatIsGround);
		if (transform.localScale.x == 1) {
			body.velocity = new Vector2 (-speed, body.velocity.y);	
		} else {
			body.velocity = new Vector2 (speed , body.velocity.y);	
		}
		if (!isInGround || hitWall) {
			transform.localScale = new Vector3 (transform.localScale.x * -1,
				transform.localScale.y, transform.localScale.z);
		}

	}
}
