using UnityEngine;
using System.Collections;

public class Spawner : MonoBehaviour {

	// Use this for initialization
	public GameObject[] elements;
	float elapsed;
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {		
		elapsed += Time.deltaTime;
		if(elapsed >= 1){
			elapsed = 0;
			generateElement ();
		}
	}

	void generateElement(){
		int index = Random.Range (0,
				elements.Length-1);
		GameObject element = elements [index];
		Instantiate (element, 
			new Vector3 (Random.Range(-5f,5f),
				transform.position.y
					, 0), 
			transform.rotation);
	}
}
