using UnityEngine;
using System.Collections;

public class CameraMovement : MonoBehaviour {

	// Use this for initialization
	Player player;
	float distancetoMove;
	bool isCreated;
	string current;
	void Start () {
		current = 
			PlayerPrefs.GetString ("color", "green");
	}
	
	// Update is called once per frame
	void Update () {
		if (!isCreated) {
			player = 
				GameObject.Find (current).GetComponent<Player> ();
			if (player != null) {
				isCreated = true;
			}
		} else {
			distancetoMove = 
				player.transform.position.x - 
				transform.position.x;
			transform.position = new Vector3 (
				distancetoMove + transform.position.x,
				transform.position.y, transform.position.z);
		}

	}
}
