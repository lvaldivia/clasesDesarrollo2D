using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class Player : MonoBehaviour {

	// Use this for initialization
	Rigidbody2D body;
	Animator anim;
	string color;
	List<string> colors;
	public static Player instance;
	public bool alive;
	public int life;

	void Awake(){
		instance = this;
	}

	void Start () {
		alive = true;
		life = GameObject.FindGameObjectsWithTag ("lifes").Length;
		anim = GetComponent<Animator> ();
		body = GetComponent<Rigidbody2D> ();

		colors = new List<string> ();
		colors.Add ("green");
		colors.Add ("yellow");
		colors.Add ("pink");
		colors.Add ("blue");
		color = colors[Random.Range(0,colors.Count)];
		anim.Play (color + "_anim");
	}
	
	// Update is called once per frame
	void Update () {
		if(Input.GetKeyDown(KeyCode.Alpha1)){
			color = "green";
			anim.Play (color + "_anim");
		}
		if(Input.GetKeyDown(KeyCode.Alpha2)){
			color = "blue";
			anim.Play (color + "_anim");
		}
		if(Input.GetKeyDown(KeyCode.Alpha3)){
			color = "pink";
			anim.Play (color + "_anim");
		}
		if(Input.GetKeyDown(KeyCode.Alpha4)){
			color = "yellow";
			anim.Play (color + "_anim");
		}

		if (Input.GetKey (KeyCode.LeftArrow)) {
			body.velocity = new Vector2 (-2f, body.velocity.y);
			transform.localScale = new Vector3 (-1f, 1f, 1f);
		}else if(Input.GetKeyUp (KeyCode.LeftArrow)){
			body.velocity = new Vector2 (0, body.velocity.y);
		}

		if (Input.GetKey (KeyCode.RightArrow)) {
			body.velocity = new Vector2 (2f, body.velocity.y);
			transform.localScale = new Vector3 (1f, 1f, 1f);
		}else if(Input.GetKeyUp (KeyCode.RightArrow)){
			body.velocity = new Vector2 (0, body.velocity.y);
		}

	}

	void OnTriggerEnter2D(Collider2D coll){
		coll.gameObject.SetActive (false);
		if (coll.gameObject.tag == color) {
			Hud.instance.updateScore (100);
		} else {
			life--;
			print (life);
			GameObject.FindGameObjectWithTag ("lifes").SetActive (false);	
		}
		if (life == 0) {
			gameObject.SetActive (false);
			alive = false;
			Hud.instance.loseGame ();
		}
	}
}
