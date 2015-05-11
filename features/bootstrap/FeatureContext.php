<?php
 
use Behat\Behat\Context\ClosuredContextInterface,
    Behat\Behat\Context\TranslatedContextInterface,
    Behat\Behat\Context\BehatContext,
    Behat\Behat\Exception\PendingException,
    Behat\MinkExtension\Context\MinkContext;
use Behat\Gherkin\Node\PyStringNode,
    Behat\Gherkin\Node\TableNode;
use Drupal\DrupalExtension\Context\DrupalContext;
 
require_once 'PHPUnit/Autoload.php';
require_once 'PHPUnit/Framework/Assert/Functions.php';
 
class FeatureContext extends DrupalContext
{
    private $output;
 
    /** @BeforeScenario */
    public function moveToTestFolder() {
        mkdir('test');
        chdir('test');
    }
 
    /** @AfterScenario */
    public function moveFromTestFolder() {
        chdir('..');
        if (is_dir('test')) {
            system('rm -r '.realpath('test'));
        }
    }
 
    /** @Given /^I have a file named "([^"]*)"$/ */
    public function iHaveAFileNamed($file) {
        touch($file);
    }
 
    /**
     * @Given /^I have a directory named "([^"]*)"$/
     */
    public function iHaveADirectoryNamed($dir) {
        mkdir($dir);
    }
 
    /** @When /^I run "([^"]*)"$/ */
    public function iRun($command) {
        exec($command, $output);
        $this->output = trim(implode("\n", $output));
    }
 
    /** @Then /^I should see "([^"]*)" in the output$/ */
    public function iShouldSeeInTheOutput($string) {
        assertContains($string, explode("\n", $this->output));
    }
}