using UnityEngine;
using System.Collections;

public class MovingElement : MonoBehaviour {

	// Use this for initialization
	public float speed;
	Vector3 limit;
	void Start () {
		limit = 
			GameObject.Find ("limit").
			transform.position;
	}
	
	// Update is called once per frame
	void Update () {
		Vector3 position = transform.position;
		position.y -= speed*Time.deltaTime;
		transform.position = position;
		if(limit.y>transform.position.y){
			Destroy (gameObject);
		}
	}
}
