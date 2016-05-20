using UnityEngine;
using System.Collections;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class Hud : MonoBehaviour {

	public static Hud instance;
	public Text scoretxt;
	public GameObject maxScore;
	int score;

	void Awake(){
		instance = this;	
	}

	void Start () {
		score = 0;
		scoretxt.text = "Score " + score;
		maxScore.SetActive (false);
		int max_score = PlayerPrefs.GetInt ("maxScore", 0);
		if (max_score > 0) {
			maxScore.GetComponent<Text> ().text = "Max Score " + max_score;
			maxScore.SetActive (true);
		}
	}

	public void updateScore(int tmpScore){
		score += tmpScore;
		scoretxt.text = "Score " + score;
	}

	public void loseGame(){
		PlayerPrefs.SetInt ("score", score);
		if (PlayerPrefs.GetInt ("maxScore", 0) < score) {
			PlayerPrefs.SetInt ("maxScore", score);	
		}
		Invoke ("sendGameOver", 2f);

	}

	void sendGameOver(){
		SceneManager.LoadScene ("GameOver");
	}

}
