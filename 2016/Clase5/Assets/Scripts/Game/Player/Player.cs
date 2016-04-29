using UnityEngine;
using System.Collections;
using Utils.Player;

public class Player : MonoBehaviour {

	// Use this for initialization
	private Rigidbody2D body;
	private Collider2D coll;
	private bool canJump;
	private float scaleX;
	private Animator anim;

	public LayerMask whatIsGround;
	[SerializeField]
	private float speed;
	public float jumpPower;

	private Transform groundPosition;
	public float radiusGroundPosition;

	void Start () {
		groundPosition = 
			GameObject.Find ("ground").transform;
		
		scaleX = transform.localScale.x;
		body = GetComponent<Rigidbody2D> ();
		coll = GetComponent<Collider2D> ();
		anim = GetComponent<Animator> ();
		anim.Play (gameObject.name + "_" + 
							PlayerStates.IDLE);

	}
	
	// Update is called once per frame
	void Update () {
		//canJump = Physics2D.IsTouchingLayers 
				//(coll, whatIsGround);
		canJump = Physics2D.OverlapCircle 
			(groundPosition.position,
			radiusGroundPosition, whatIsGround);
		
		body.velocity = new Vector2 (speed, body.velocity.y);
		if (canJump) {
			anim.Play (gameObject.name);
			if (Input.GetKeyDown (KeyCode.Space)
					|| Input.GetMouseButtonDown(0)) {
				body.velocity = new Vector2 (body.velocity.x, 
							jumpPower);
			}	
		}

	}
}
