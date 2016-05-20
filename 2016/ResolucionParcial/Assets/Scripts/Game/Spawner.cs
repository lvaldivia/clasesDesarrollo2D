using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class Spawner : MonoBehaviour {

	// Use this for initialization
	public GameObject[] elements;
	float elapsed;
	List<GameObject> enemys;
	void Start () {
		enemys = new List<GameObject> ();
		int total = 0;
		for(int i = 0; i<elements.Length*2;i++){
			GameObject go = Instantiate (elements [total], 
				transform.position, transform.rotation) as GameObject;
			go.SetActive (false);
			enemys.Add (go);
			total++;
			if (total == elements.Length) {
				total = 0;
			}
		}

	}

	void Update () {
		if (Player.instance.alive) {
			elapsed += Time.deltaTime;
			if (elapsed >= 1f) {
				GenerateMonster ();
				elapsed = 0;
			}	
		}

	}

	void GenerateMonster(){
		int random = Random.Range (0, enemys.Count);
		while (true) {
			if (!enemys [random].activeInHierarchy) {
				enemys [random].transform.position = 
					new Vector3 (Random.Range (-5f, 5f), transform.position.y, transform.position.z);
				enemys [random].SetActive (true);
				break;
			} else {
				random = Random.Range (0, enemys.Count);
			}
		}
	}
}
