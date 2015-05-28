<?php

use Drupal\DrupalExtension\Context\RawDrupalContext;
use Behat\Behat\Context\SnippetAcceptingContext;
use Behat\Gherkin\Node\PyStringNode;
use Behat\Gherkin\Node\TableNode;

use Behat\Behat\Tester\Exception\PendingException;
use Symfony\Component\Yaml\Yaml;

/**
 * Defines application features from the specific context.
 */
class FeatureContext extends RawDrupalContext implements SnippetAcceptingContext {

    /**
     * Initializes context.
     *
     * Every scenario gets its own context instance.
     * You can also pass arbitrary arguments to the
     * context constructor through behat.yml.
     */
    public function __construct() {
    }

    /**
     * @When I fill in :username_field and :password_field with CAS credentials
     */
    public function iFillInAndWithCasCredentials($username_field, $password_field)
    {
        $casaccount = Yaml::parse(file_get_contents('casaccount.yml'));

        $username_field = $this->fixStepArgument($username_field);
        $username = $this->fixStepArgument($casaccount['username']);
        $this->getSession()->getPage()->fillField($username_field, $username);

        $password_field = $this->fixStepArgument($password_field);
        $password = $this->fixStepArgument($casaccount['password']);
        $this->getSession()->getPage()->fillField($password_field, $password);       
    }

    /**
    * Returns fixed step argument (with \\" replaced back to ").
    *
    * @param string $argument
    *
    * @return string
    */
    protected function fixStepArgument($argument) {
    return str_replace('\\"', '"', $argument);
    }
}
