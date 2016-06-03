using UnityEngine;
using System.Collections;

public class MovingPlatform : MonoBehaviour {

	public Transform[] positions;
	public GameObject platform;
	int currentIndex;
	Transform currentPosition;
	public float speed;
	void Start () {
		currentPosition = positions [currentIndex];
	}

	void Update () {
		platform.transform.position = 
			Vector3.MoveTowards (platform.transform.position, currentPosition.position,
			speed * Time.deltaTime);
		if (platform.transform.position == currentPosition.position) {
			currentIndex++;
			if (currentIndex == positions.Length) {
				currentIndex = 0;
			}
			currentPosition = positions [currentIndex];
		}
	}
}
