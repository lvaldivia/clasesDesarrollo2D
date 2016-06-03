﻿using UnityEngine;
using System.Collections;
using UnityEngine.UI;

public class Hero : MonoBehaviour {

	// Use this for initialization
	Rigidbody2D body;
	public LayerMask whatIsGround;
	public Transform groundPos;
	public float radius;
	public float jumpPower;
	bool doubleJump;
	bool onGround;
	public bool alive;
	public static Hero instance;

	public GameObject sliderGo;
	Slider slider;
	int life = 2;

	public float knockBackCount;
	public float knockBack;
	public float knockBackLenght;
	public bool knockbackRight;

	public float climbPower;
	public float lastGravity;
	public bool onLadder;
	public float climbVelocity;


	void Awake(){
		instance = this;
	}

	void Start () {
		alive = true;
		slider = sliderGo.GetComponent<Slider> ();
		slider.maxValue = life;
		slider.minValue = 0;
		slider.wholeNumbers = true;
		slider.value = life;
		body = GetComponent<Rigidbody2D> ();
		lastGravity = body.gravityScale;
	}
		
	void Update () {
		if (transform.position.y < -Camera.main.orthographicSize && alive) {
			gameObject.SetActive (false);
			alive = false;
			life--;
			slider.value = life;
			if (life == 0) {
				sliderGo.SetActive (false);
			}
			Invoke ("restart", 3f);
		}
		onGround = Physics2D.OverlapCircle 
			(groundPos.position, radius, whatIsGround);
		if (Input.GetKeyDown (KeyCode.Space)) {
			if (onGround) {
				doubleJump = false;
				body.velocity = 
					new Vector2 (body.velocity.x, jumpPower);
			} else {
				if (!doubleJump) {
					doubleJump = true;
					body.velocity = 
						new Vector2 (body.velocity.x, jumpPower);
				}
			}
		} 
		float forceX = 0;	
		if (Input.GetKey (KeyCode.LeftArrow)) {
			forceX = -2f;
			transform.localScale = new Vector3 (-1f, 1f, 1f);
		}

		if(Input.GetKey(KeyCode.RightArrow)){
			forceX = 2f;
			transform.localScale = new Vector3 (1f, 1f, 1f);
		}

		if (knockBackCount > 0) {
			if (knockbackRight) {
				body.velocity = new Vector2 (-knockBack,knockBack);
			} else {
				body.velocity = new Vector2 (knockBack,knockBack);
			}
			knockBackCount -= Time.deltaTime;
		} else {
			body.velocity = new Vector2 (forceX, body.velocity.y);
		}

		if (onLadder) {
			body.gravityScale = 0;
			climbVelocity = climbPower *
				Input.GetAxis ("Vertical");
			body.velocity = new Vector2 (body.velocity.x,
				climbVelocity);
			
		} else {
			body.gravityScale = lastGravity;
		}

	}

	void restart(){
		SafePointController.instance.restart ();
	}


	void OnCollisionEnter2D(Collision2D coll){
		if (coll.gameObject.tag == "moving") {
			transform.parent = coll.transform;
		}
	}

	void OnCollisionExit2D(Collision2D coll){
		if (coll.gameObject.tag == "moving") {
			transform.parent = null;
		}
	}
}