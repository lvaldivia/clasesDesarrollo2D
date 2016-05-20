using UnityEngine;
using System.Collections;

public class SafePointController : MonoBehaviour {

	// Use this for initialization
	public static SafePointController instance;
	public Transform position;
	void Awake(){
		instance = this;
	}
}
