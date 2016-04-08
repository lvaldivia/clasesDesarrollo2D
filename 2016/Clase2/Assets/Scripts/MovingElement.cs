using UnityEngine;
using System.Collections;

public class MovingElement : MonoBehaviour
{

	// Use this for initialization
	public float speed;
	Vector3 limit;

	void Start ()
	{
		limit = GameObject.Find ("limit").transform.position;
		transform.localScale = 
			new Vector3 (transform.localScale.x * 2,
			transform.localScale.y * 2,
			transform.localScale.z * 2);
	}
	
	// Update is called once per frame
	void Update ()
	{
		if (gameObject.activeInHierarchy) 
		{
			Vector3 position = transform.position;
			position.x -= speed * Time.deltaTime;
			transform.position = position;
			if (limit.x > transform.position.x) 
			{
				gameObject.SetActive (false);
			}
		}
	}
}
