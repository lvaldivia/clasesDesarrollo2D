using UnityEngine;
using System.Collections;

public class PlayerGenerator : MonoBehaviour {

	public GameObject[] players;
	void Start () {
		string color = PlayerPrefs.GetString ("color", "green");
		GameObject currentPlayer;
		switch (color) {
			case "green":
			currentPlayer = 
				Instantiate (players [0],
				transform.position, transform.rotation) as GameObject;
			break;
			case "pink":
			currentPlayer = 
				Instantiate (players [1],
					transform.position, transform.rotation) as GameObject;
				break;
			case "yellow":
			currentPlayer = 
				Instantiate (players [2],
					transform.position, transform.rotation) as GameObject;
				break;
			case "blue":
			currentPlayer = 
				Instantiate (players [3],
					transform.position, transform.rotation) as GameObject;
				break;
		}


	}
	
	// Update is called once per frame
	void Update () {
	
	}
}
