using UnityEngine;
using System.Collections;

public class PlatformGenerator : MonoBehaviour {

	// Use this for initialization

	public GameObject[] platforms;
	private float[] platformsWidth;

	public int minWidth;
	public int maxWidth;
	public int distanceToPlatform;

	private float maxDistanceHeight;
	private float minDistanceheight;

	public Transform maxPointDistanceHeight;

	public Transform generationPoint;

	private float distanceChange;

	void Start () {
		platformsWidth = new float[platforms.Length];
		for(int i =0;i<platforms.Length;i++){
			platformsWidth[i] = platforms[i].
				GetComponent<BoxCollider2D>()
				.size.x;
		}

		minDistanceheight = transform.position.y;
		maxDistanceHeight = maxPointDistanceHeight.position.y;
	}

	void Update () {
		if(transform.position.x < 
			generationPoint.position.x){
			int random = Random.Range 
				(0, platforms.Length);
			print (random);
			distanceToPlatform = Random.Range (
				minWidth, maxWidth);
			distanceChange = transform.position.y +
			(Random.Range (maxDistanceHeight, -maxDistanceHeight));
			/*if (distanceChange > maxPointDistanceHeight) {
				distanceChange = maxPointDistanceHeight;
			}else if(distanceChange < minDistanceheight){
				distanceChange = minDistanceheight;
			}*/

			distanceChange = 
				Mathf.Clamp (distanceChange, minDistanceheight, maxDistanceHeight);

			transform.position = new Vector3 
				(transform.position.x + (platformsWidth [random] / 2) +
					distanceToPlatform, distanceChange, transform.position.z);

			Instantiate (platforms [random], transform.position, transform.rotation);

			transform.position = new Vector3 
				(transform.position.x + (platformsWidth [random] / 2), 
					transform.position.y, transform.position.z);
		}
	}
}
