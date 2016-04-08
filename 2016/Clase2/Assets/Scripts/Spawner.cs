using UnityEngine;
using System.Collections;
using System.Collections.Generic;
public class Spawner : MonoBehaviour
{

	// Use this for initialization
	//public GameObject element1;

	public GameObject[] elements;
	List<GameObject> enemys;
	float elapsed;
	void Start ()
	{
		enemys = new List<GameObject> ();
		createEnemy ();
		//Instantiate(element1,new Vector3(0,0,0),transform.rotation);
	}
	void createEnemy(){
		for(int i =0;i<elements.Length*3;i++){
			int index = Random.Range (0, elements.Length);
			GameObject element = Instantiate (elements [index], transform.position, transform.rotation) as GameObject;
			enemys.Add (element);
			element.SetActive (false);
		}
	}
	
	// Update is called once per frame
	void Update ()
	{
	
		elapsed += Time.deltaTime;
		if (elapsed >= 1) 
		{
			//print("crear monstruo");
			elapsed = 0;
			generateElement ();
		}
	}
	void generateElement()
	{
		int index = Random.Range (0, enemys.Count);
		while (true) 
		{
			if (!enemys [index].activeInHierarchy) {
				enemys [index].SetActive (true);
				enemys [index].transform.position = new Vector3 ( transform.position.x,Random.Range (-5f, 5f), 0);
				break;
			} else{
				index = Random.Range (0, enemys.Count);
			}
		}
	}
}
