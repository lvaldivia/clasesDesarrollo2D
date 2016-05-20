using UnityEngine;
using System.Collections;

public class BulletSpawner : MonoBehaviour {

	float elapsed;
	public GameObject bullet;
	public Transform startPosition;
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
		elapsed += Time.deltaTime;
		if (Input.GetKey (KeyCode.Z)) {
			if (elapsed >= 0.3f) {
				Instantiate (bullet, 
					startPosition.position, 
					transform.rotation);
				elapsed = 0;
			}
		}
	}
}
