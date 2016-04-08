using UnityEngine;
using System.Collections;

public class ClickManager : MonoBehaviour
{

	// Use this for initialization
	void Start ()
	{
	
	}
	
	// Update is called once per frame
	void Update ()
	{
		if (Input.GetMouseButtonDown (0)) {
			Ray hit = Camera.main.ScreenPointToRay (Input.mousePosition);
			RaycastHit2D ray = Physics2D.Raycast (hit.origin, hit.direction);
			if (ray.collider != null 
					&& ray.collider.gameObject.name != "player") {
				ray.collider.gameObject.SetActive (false);
			}
		}

	}
}
