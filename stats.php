<?php

require_once('inc/lib.php');

$stats = get_goal_stats();

if (!empty($stats))
{
    foreach($stats as $name => $value)
    {
        if (strpos($name, '_difficulty_count') !== false) {
            $difficulty = str_replace('_difficulty_count', '', $name);
            echo "difficulty {$difficulty}: <strong>{$value}</strong><br>";
        } else if (strpos($name, '_flute_location_count') !== false) {
            $location = str_replace('_flute_location_count', '', $name);
            echo "flute {$location}: <strong>{$value}</strong><br>";
        } else {
            $name = ucfirst(str_replace('_', ' ', $name));
            echo "{$name}: <strong>{$value}</strong><br>";
        }
    }
}
